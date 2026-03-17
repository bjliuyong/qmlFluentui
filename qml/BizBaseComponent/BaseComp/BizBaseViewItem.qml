import QtQuick
import "../DataManager"
import FluentUI

Item {
    id: root
    property string scopeFormId: ""
    property alias dataManager: _formEngine
    property QtObject rootContent: null


    BizBaseFormDataManager {
        id: _formEngine
        target: root                               // 设置目标对象为root
    }

    // 错误弹窗 (可选)
    FluContentDialog {
        id: errDlg
        title: "区域配置异常"
        negativeText: "关闭"
        buttonFlags: FluContentDialogType.NegativeButton
    }
    Component.onCompleted: {
        // 初始化扫描
        // 传入 scopeFormId 作为默认 Scope
        var result = _formEngine.refreshCache(root.scopeFormId)
        if (!result.success) {
            console.error(`[BizBaseViewItem] ${result.error}`)
            errDlg.message = result.error
            errDlg.open()
        }
    }
    // ================== 统一 API (与 DialogItem 完全一致) ==================
    function setFormData(data, formId)       { _formEngine.setData(data, formId) }
    function getFormData(formId)             { return _formEngine.getData(formId) }
    function getCommitData(formId,editModel) {
        var list = [];
        list.push(_formEngine.getData(formId))
        var param = {}
        param.businessParams = {}
        if(editModel=="add"){
            param.businessParams.addList = list
        }else if(editModel=="edit"){
            param.businessParams.updateList = list
        }
        return param
    }

    function setFormEnabled(enabled, formId) { _formEngine.setFormState(formId, { "enabled": enabled }) }
    function setFieldEnabled(key, enabled, formId) { _formEngine.setFieldState(key, { "enabled": enabled }, formId) }
    function setFormVisible(visible, formId) { _formEngine.setFormState(formId, { "visible": visible }) }
    function clearForm(formId)               { _formEngine.resetForm(formId) }

    function clearFormIgnore(formId, keysStr){ _formEngine.resetFormIgnore(formId, keysStr) }
    // 5. 弹窗快捷调用 (View 特有，用于管理下级弹窗)
    function openDialog(dialogName, data) {
        // 假设 contextDialogs 是由外部或者 mixin 注入的
        if (typeof contextDialogs === "undefined") return
        var dialog = contextDialogs[dialogName]
        if (dialog) {
            if (data && typeof dialog.openWithData === "function") {
                dialog.openWithData(data)
            } else {
                dialog.open()  // 否则直接打开对话框
            }
        }
    }
}
