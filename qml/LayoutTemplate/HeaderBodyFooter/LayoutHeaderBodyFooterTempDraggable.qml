// BaseLayout/qml/LayoutTemplate/LayoutHeaderBodyFooterTempDraggable.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "../../FluComponent"
import FluentUI

Item {
    id: baseRoot


    Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.margins: kMargin

    readonly property int kMargin: 10
    readonly property int kSpacing: 10
    readonly property int kHeaderMinH: 60
    readonly property int kBodyMinH: 200
    readonly property int kFooterMinH: 60
    readonly property int kLayoutMinW: 800

    implicitWidth: staticMinWidth
    implicitHeight: staticMinHeight

    property int headerWeight: 1
    property int bodyWeight: 6
    property int footerWeight: 3

    // 保持比例计算，用于给 Header 和 Footer 赋初始值
    property real _pixelPerRatio: Math.max(0, baseRoot.height) /
                                  (headerWeight + bodyWeight + footerWeight)

    /* ========= 对外插槽 ========= */
    property alias headerContent: headerContainer.data
    property alias bodyContent: bodyContainer.data
    property alias footerContent: footerContainer.data

    readonly property int staticMinHeight: (kMargin * 4)
                                           + kHeaderMinH + kBodyMinH + kFooterMinH
    readonly property int staticMinWidth: kLayoutMinW + (kMargin * 2)

    //=====================方案A常用信号模板层声明好================
    /*
    property var _injectedHeader: headerContainer.children.length > 0 ? headerContainer.children[0] : null
    property var _injectedFooter: footerContainer.children.length > 0 ? footerContainer.children[0] : null


    property var onEditStatusChangedAction: editStatusChangedMethod
    function editStatusChangedMethod(headerItem, footerItem) {
            if (footerItem) {
                console.log("正在操作 Footer...")
                footerItem.setName("来自模板的修改")
            }
    }
    // 3. 自动连接 Footer 的提交信号
    Connections {
        id: cancleSignal
        target: _injectedHeader
        ignoreUnknownSignals: true

        function onChangedEditStatus() {
            console.log("[Template] 检测到 Header 编辑状态变更...")
            // 【第二步】判断外部有没有传入自定义函数
            if (baseRoot.onEditStatusChangedAction && typeof baseRoot.onEditStatusChangedAction === "function") {
                // 【关键点】把模板内部的私有对象 (_injectedFooter, _injectedHeader) 传给外部函数
                // 这样外部函数才能操作这些内部控件
                baseRoot.onEditStatusChangedAction(_injectedHeader, _injectedFooter)
            } else {
                // (可选) 如果外部没传函数，执行默认逻辑
                console.log("[Template] 执行默认逻辑")
                if (_injectedHeader && _injectedFooter && typeof _injectedFooter.setName === "function") {
                    _injectedFooter.setName("test")
                }
            }
        }
    }

    */


    //================================方案B模板层面的自动注入
    /*
    property var _injectedHeader: headerContainer.children[0] || null
    property var _injectedFooter: footerContainer.children[0] || null

    // 监听注入对象变化，一旦就位，开始连线
    on_InjectedHeaderChanged: autoWire()
    on_InjectedFooterChanged: autoWire()

    function autoWire() {
        if (_injectedHeader && _injectedFooter) {
            console.log("[Template] 开始自动装配 Header 和 Footer...")

            // 1. 把 Footer 塞给 Header (如果 Header 有 contextFooter 属性)
            if ("contextFooter" in _injectedHeader) {
                _injectedHeader.contextFooter = _injectedFooter
            }
            // 2. 把 Header 塞给 Footer (如果 Footer 有 contextHeader 属性)
            if ("contextHeader" in _injectedFooter) {
                _injectedFooter.contextHeader = _injectedHeader
            }
        }
        if ("disabled" in _injectedHeader) {
            _injectedHeader.disabled = Qt.binding(function() { return baseRoot.globalDisabled })
        }

        // 绑定 Footer
        if ("disabled" in _injectedFooter) {
            _injectedFooter.disabled = Qt.binding(function() { return baseRoot.globalDisabled })
        }

        console.log("[Template] 共享状态绑定完成")
    }
*/


    //================================弹窗
    ///*

    property alias dialogContent: dialogContainer.data
    Item {
        id: dialogContainer
        z: 999
        anchors.fill: parent
        // 只有子控件会阻挡鼠标，容器本身穿透
        visible: children.length > 0

        // 【关键】组件创建完成时，主动触发一次扫描，防止 resources 不触发 onChildrenChanged
        Component.onCompleted: baseRoot.updateDialogMap()
        onChildrenChanged: baseRoot.updateDialogMap()
    }

    // 存储弹窗映射表
    property var _dialogMap: ({})

    function updateDialogMap() {
        var map = {}

        // 1. 遍历 resources (FluContentDialog 等基于 Popup 的组件通常在这里)
        var resList = dialogContainer.resources
        for(var i = 0; i < resList.length; i++) {
            var item = resList[i]
            // 使用 objectName 作为 Key
            if (item.objectName) {
                map[item.objectName] = item
                console.log("[Template] 注册 Resource 弹窗:", item.objectName)
            }
        }

        // 2. 遍历 children (基于 Item 的自定义弹窗在这里)
        var childList = dialogContainer.children
        for(var j = 0; j < childList.length; j++) {
            var child = childList[j]
            if (child.objectName) {
                map[child.objectName] = child
                console.log("[Template] 注册 Child 弹窗:", child.objectName)
            }
        }

        _dialogMap = map
        // 地图更新后，重新给 Header/Body/Footer 注入最新的 map
        autoWire()
    }
    // 获取三个区域的实例
    property var _injectedHeader: headerContainer.children.length > 0 ? headerContainer.children[0] : null
    property var _injectedBody:   bodyContainer.children.length > 0   ? bodyContainer.children[0]   : null
    property var _injectedFooter: footerContainer.children.length > 0 ? footerContainer.children[0] : null

    // 监听变化
    on_InjectedHeaderChanged: autoWire()
    on_InjectedBodyChanged:   autoWire()
    on_InjectedFooterChanged: autoWire()

    function autoWire() {
        // 这里的判断是为了防止初始化时 Map 还没生成，强制生成一次
        if (Object.keys(_dialogMap).length === 0 && (dialogContainer.children.length > 0 || dialogContainer.resources.length > 0)) {
            updateDialogMap()
        }

        console.log("[Template] 开始注入依赖...")

        var targets = []
        if (_injectedHeader) targets.push(_injectedHeader)
        if (_injectedBody)   targets.push(_injectedBody)
        if (_injectedFooter) targets.push(_injectedFooter)

        for (var key in _dialogMap) {
            var dialog = _dialogMap[key]
            if (dialog) {
                targets.push(dialog)
            }
        }

        targets.forEach(function(target) {
            // 只有继承了 BizViewItem (拥有对应属性) 的组件才会被注入

            // 1. 互相注入引用
            if ("contextHeader" in target) target.contextHeader = _injectedHeader
            if ("contextFooter" in target) target.contextFooter = _injectedFooter
            if ("contextBody" in target)   target.contextBody   = _injectedBody

            // 2. 注入弹窗字典 (关键)
            if ("contextDialogs" in target) target.contextDialogs = _dialogMap

            // 3. 注入根节点
            if ("contextRoot" in target)    target.contextRoot    = baseRoot
        })
    }
    //*/
    //==============================弹窗


    FluSplitLayout {
        id: splitView
        anchors.fill: parent
        anchors.margins: kMargin
        orientation: Qt.Vertical


        FluShadowGroupBox {

            SplitView.fillWidth: true

            // Header 保持使用 preferredHeight 设置初始大小
            SplitView.preferredHeight: headerWeight * _pixelPerRatio
            SplitView.minimumHeight: kHeaderMinH
            SplitView.minimumWidth: kLayoutMinW

            FluRectangle {
                id: headerContainer
                anchors.fill: parent
                anchors.margins: 10
                radius: 4
                clip: true
            }
        }


        FluShadowGroupBox {

            SplitView.fillWidth: true

            SplitView.fillHeight: true
            SplitView.minimumHeight: kBodyMinH
            SplitView.minimumWidth: kLayoutMinW

            ScrollView {
                id: bodyScrollView
                anchors.fill: parent
                anchors.margins: 2
                clip: true

                ScrollBar.horizontal.policy: ScrollBar.AsNeeded
                ScrollBar.vertical.policy: ScrollBar.AsNeeded

                Item {
                    id: bodyContainer
                    width: bodyScrollView.availableWidth
                    implicitHeight: childrenRect.height
                }
            }
        }

        /* ================= FOOTER ================= */
        FluShadowGroupBox {

            SplitView.fillWidth: true

            // Footer 保持使用 preferredHeight 设置初始大小
            SplitView.preferredHeight: footerWeight * _pixelPerRatio
            SplitView.minimumHeight: kFooterMinH
            SplitView.minimumWidth: kLayoutMinW

            Item {
                id: footerContainer
                anchors.fill: parent
                anchors.margins: 10
                clip: true
            }
        }
    }
}
