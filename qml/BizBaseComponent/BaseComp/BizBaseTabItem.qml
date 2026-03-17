import QtQuick
import "../DataManager"
import FluentUI

Item {
    id: root

    // ================== 原有属性保持不变 ==================
    property string scopeFormId: ""
    property alias dataManager: _formEngine

    property string title: "未命名页签"
    property alias text: root.title
    property QtObject rootContent: null

    BizBaseFormDataManager {
        id: _formEngine
        target: root // 默认指向root，但在 wrapper 中会重新定向
    }

    FluContentDialog {
        id: errDlg
        title: "区域配置异常"
        negativeText: "关闭"
        buttonFlags: FluContentDialogType.NegativeButton
    }

    function setFormData(data, formId)       { _formEngine.setData(data, formId) }
    function getFormData(formId)             { return _formEngine.getData(formId) }
    function getCommitData(formId, editModel) {
        var list = [];
        list.push(_formEngine.getData(formId))
        var param = {}
        param.businessParams = {}
        if(editModel == "add"){
            param.businessParams.addList = list
        } else if(editModel == "edit"){
            param.businessParams.updateList = list
        }
        return param
    }

    function setFormEnabled(enabled, formId) { _formEngine.setFormState(formId, { "enabled": enabled }) }
    function setFieldEnabled(key, enabled, formId) { _formEngine.setFieldState(key, { "enabled": enabled }, formId) }
    function setFormVisible(visible, formId) { _formEngine.setFormState(formId, { "visible": visible }) }
    function clearForm(formId)               { _formEngine.resetForm(formId) }
    function clearFormIgnore(formId, keysStr){ _formEngine.resetFormIgnore(formId, keysStr) }
    property list<Item> visualChildren
    default property alias content: root.visualChildren

    // ================== 修改核心部分 ==================

    /**
     * 【新增】内容代理
     * 用户如果需要完全自定义内容布局且包含自动扫描功能，请覆盖此属性，而不是 contentItem。
     */
    property Component contentDelegate: defaultContentDelegate

    /**
     * 【新增】默认内容代理
     * 包含原有的“搬运子控件”逻辑，用于支持直接在 BizBaseTabItem 下写子控件的旧写法。
     */
    property Component defaultContentDelegate: Component {
        Item {
            id: defaultContainer
            anchors.fill: parent

            // 1. 搬运 visualChildren 的逻辑 (兼容旧代码)
            Component.onCompleted: {
                for(var i = 0; i < root.visualChildren.length; i++) {
                    var child = root.visualChildren[i]
                    if (child) {
                        if (child.toString().indexOf("null") !== -1) continue;
                        child.parent = defaultContainer
                        if(!child.width && !child.height && !child.anchors.centerIn) {
                            child.anchors.fill = defaultContainer
                        }
                    }
                }
            }

            // 2. 销毁时归还 (兼容旧代码)
            Component.onDestruction: {
                for(var i = defaultContainer.children.length - 1; i >= 0; i--) {
                    var child = defaultContainer.children[i]
                    if (child instanceof Item) {
                         child.visible = false
                         child.parent = root
                    }
                }
            }

            // 3. 定义事件转发函数，供 Wrapper 调用
            function tabActivated() {
                for(var i = 0; i < defaultContainer.children.length; i++) {
                    var item = defaultContainer.children[i]
                    if (item.tabActivated && typeof item.tabActivated === 'function') {
                        item.tabActivated()
                    }
                }
            }

            function tabDeactivated() {
                for(var i = 0; i < defaultContainer.children.length; i++) {
                    var item = defaultContainer.children[i]
                    if (item.tabDeactivated && typeof item.tabDeactivated === 'function') {
                        item.tabDeactivated()
                    }
                }
            }
        }
    }

    /**
     * 【修改】固定包装器
     * 外部 TabView 实际加载的是这个 contentItem。
     * 它负责加载 contentDelegate 并执行自动扫描。
     */
    property Component contentItem: Component {
        Item {
            id: wrapper
            anchors.fill: parent
            enabled: root.enabled
            // 使用 Loader 加载用户的 contentDelegate
            Loader {
                id: contentLoader
                anchors.fill: parent
                sourceComponent: root.contentDelegate

                // 加载完成后，如果当前是显示状态，立即触发激活
                onLoaded: {
                    if (item && root.visible && typeof item.tabActivated === 'function') {
                        item.tabActivated()
                    }
                }
            }

            // 统一的初始化与扫描逻辑
            Component.onCompleted: {
                // 1. 触发外部信号
                if(root.visible) root.tabActivated()

                if (contentLoader.item) {
                    // 2. 【核心】将 DataManager 目标指向实际加载的内容
                    _formEngine.target = contentLoader.item

                    // 3. 【核心】自动执行扫描
                    var result = _formEngine.refreshCache(root.scopeFormId)

                    // 4. 错误处理
                    if (!result.success) {
                        console.error(`[BizBaseTabItem] ${result.error}`)
                        errDlg.message = result.error
                        errDlg.open()
                    }
                }
            }

            // 统一的可见性与事件转发逻辑
            onVisibleChanged: {
                if (visible) root.tabActivated()
                else root.tabDeactivated()

                var targetItem = contentLoader.item
                if (targetItem) {
                    if (visible) {
                        if (typeof targetItem.tabActivated === 'function') targetItem.tabActivated()
                    } else {
                        if (typeof targetItem.tabDeactivated === 'function') targetItem.tabDeactivated()
                    }
                }
            }
        }
    }

    // 信号定义
    signal tabActivated()
    signal tabDeactivated()
}
