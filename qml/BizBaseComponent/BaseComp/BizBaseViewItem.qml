import QtQuick
import "../DataManager"
Item {
    id: root

    // 内部集成逻辑引擎
    BizBaseFormDataManager {
        id: _formEngine
        target: root
    }

    // ================== 公共 API ==================

    // 1. 数据操作
    function setFormData(data, formId) { _formEngine.setData(data, formId) }
    function getFormData(formId)       { return _formEngine.getData(formId) }

    // 2. 状态控制 (启用/禁用)
    function setFormEnabled(enabled, formId) {
        _formEngine.setFormState(formId, { "enabled": enabled })
    }
    function setFieldEnabled(key, enabled, formId) {
        _formEngine.setFieldState(key, { "enabled": enabled }, formId)
    }

    // 3. 状态控制 (显示/隐藏)
    function setFormVisible(visible, formId) {
        _formEngine.setFormState(formId, { "visible": visible })
    }

    // 4. 重置表单
    function clearForm(formId) {
        _formEngine.resetForm(formId)
    }

    // 5. 弹窗快捷调用
    function openDialog(dialogName, data) {
        if (!contextDialogs) return
        var dialog = contextDialogs[dialogName]
        if (dialog) {
            if (data && typeof dialog.openWithData === "function") {
                dialog.openWithData(data)
            } else {
                dialog.open()
            }
        }
    }
}
