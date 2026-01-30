import QtQuick
import FluentUI
import "../DataManager"
FluContentDialog {
    id: root

    property bool editStatus:false

    signal confirmed(var data)
    Component.onCompleted: {
        console.log("BizBaseDialogItem初始化")
    }
    Component.onDestruction: {
            console.log("BizBaseDialogItem被销毁了")
    }
    // 内部集成逻辑引擎 (自动指向 contentItem)
    BizBaseFormDataManager {
        id: _formEngine
        target: root.contentItem
    }

    // 自动刷新缓存
    // onContentItemChanged: {
    //     if (root.contentItem) {
    //             _formEngine.target = root.contentItem
    //         }

    //         _formEngine.refreshCache()
    //         _tryInjectData()
    // }

    property var _pendingData: null
    property string _pendingFormId: ""

    // 打开并填充数据 (支持指定 formId)
    function openWithData(initData, formId) {
        _pendingData = initData
        _pendingFormId = formId || "default"
        root.open()
        _tryInjectData()
    }

    function _tryInjectData() {
        if (_pendingData && root.contentItem) {
            _formEngine.setData(_pendingData, _pendingFormId)
            _pendingData = null
        }
    }

    // 默认点击确定返回 "default" 表单数据
    onPositiveClicked: {
        // var data = _formEngine.getData("default")
        root.confirmed(data)
    }
    onContentItemChanged: {
            // 当 contentItem 变成 null（销毁）时，通知引擎清空缓存
            if (!root.contentItem) {
                 _formEngine.target = null // 断开连接
                 // 如果你在 Manager 里写了清理逻辑，这里甚至可以直接 _formEngine.clearCache()
            } else {
                console.log("chushihua ")
                 // 正常初始化逻辑
                 _formEngine.target = root.contentItem
                 _formEngine.refreshCache()
                 _tryInjectData()
            }
        }

    // ================== 公共 API (同 BizViewItem) ==================
    function setFormData(data, formId)       { _formEngine.setData(data, formId) }
    function getFormData(formId)             { return _formEngine.getData(formId) }
    function setFormEnabled(enabled, formId) { _formEngine.setFormState(formId, { "enabled": enabled }) }
    function clearForm(formId)               { _formEngine.resetForm(formId) }
}
