import QtQuick
import FluentUI
import "../DataManager"
FluContentDialog {
    id: root

    signal confirmed(var data)

    // 内部集成逻辑引擎 (自动指向 contentItem)
    BizBaseFormDataManager {
        id: _formEngine
        target: root.contentItem
    }

    // 自动刷新缓存
    onContentItemChanged: {
        _formEngine.refreshCache()
        _tryInjectData()
    }

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
        var data = _formEngine.getData("default")
        root.confirmed(data)
    }

    // ================== 公共 API (同 BizViewItem) ==================
    function setFormData(data, formId)       { _formEngine.setData(data, formId) }
    function getFormData(formId)             { return _formEngine.getData(formId) }
    function setFormEnabled(enabled, formId) { _formEngine.setFormState(formId, { "enabled": enabled }) }
    function clearForm(formId)               { _formEngine.resetForm(formId) }
}
