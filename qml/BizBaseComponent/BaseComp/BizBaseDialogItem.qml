import QtQuick
import FluentUI
import "../DataManager"

// 定义一个自定义的对话框组件，继承自FluContentDialog
FluContentDialog {
    id: root

    signal confirmed()
    // 待处理的数据（用于初始化时填充表单）
    property var _pendingData: null
    // 待处理的表单ID（用于指定使用哪个表单配置）
    property string _pendingFormId: ""

    property string scopeFormId: ""

    property QtObject rootContent: null

    // 内部集成逻辑引擎
    BizBaseFormDataManager {
        id: _formEngine
        target: root.contentItem
    }

    // 正面按钮（确定）点击时触发
    onPositiveClicked: {
        // 获取默认表单的数据
        var data = _formEngine.getData("default")
        // 触发确认信号，传递获取到的数据
        root.confirmed(data)
    }


    // 打开并填充数据
    function openWithData(initData, formId) {
        // 设置待处理的数据和表单ID
        _pendingData = initData
        _pendingFormId = formId || "default"
        // 打开对话框
        root.open()

        _tryInjectData()
    }
      // 尝试注入数据到表单中
    function _tryInjectData() {
        if (_pendingData && _formEngine.target) {
            // 此时 target 存在，_getFields 会自动触发 refreshCache
            // 使用表单引擎设置数据
            _formEngine.setData(_pendingData, _pendingFormId)
            // 清空待处理数据
            _pendingData = null
        }
    }

    Component.onCompleted: {

        if(root.contentItem){
            _formEngine.target = root.contentItem
            _formEngine.refreshCache()
        }
    }
    onOpened:{
        // 1. 显式更新 target
        _formEngine.target = root.contentItem
        _formEngine.refreshCache()
        // 2. 尝试注入暂存的数据 (如果有)
        _tryInjectData()
    }



    // ================== 统一 API (与 ViewItem 完全一致) ==================
    // 直接代理给 _formEngine
    function setFormData(data, formId)       { _formEngine.setData(data, formId) }
    function getFormData(formId)             { return _formEngine.getData(formId) }

    // 设置表单启用/禁用状态
    function setFormEnabled(enabled, formId) { _formEngine.setFormState(formId, { "enabled": enabled }) }
    function setFieldEnabled(key, enabled, formId) { _formEngine.setFieldState(key, { "enabled": enabled }, formId) }
    function setFormVisible(visible, formId) { _formEngine.setFormState(formId, { "visible": visible }) }
    function clearForm(formId)               { _formEngine.resetForm(formId) }

}
