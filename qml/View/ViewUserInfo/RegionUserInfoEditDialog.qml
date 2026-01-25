// BaseLayout/qml/View/ViewUserInfo/RegionUserInfoEditDialog.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI
import "../../BizBaseComponent/BaseComp"
import "../../BizComponent"

BizBaseDialogItem {
    id: dialogRoot
    title: "编辑用户信息"

    contentDelegate: Component {
        ColumnLayout {
            id: formColumn
            spacing: 15
            width: 300


            BizTextInput {
                formId:"userInfo"
                id: inputName
                label: "用户姓名"
                key: "name"
                required: true
            }

            BizTextInput {
                id: inputDoc
                formId:"userInfo"
                label: "证件号码"
                key: "docNum"
            }
            BizTextInput {
                id: inputDoc1
                formId:"userInfo"
                label: "证件号码"
                key: "docNum1"
            }
            BizTextInput {
                id: inputDoc2
                formId:"userInfo"
                label: "证件号码"
                key: "docNum2"
            }
            BizTextInput {
                id: inputDoc3
                formId:"userInfo"
                label: "证件号码"
                key: "docNum3"
            }
            BizTextInput {
                id: inputDoc4
                formId:"userInfo"
                label: "证件号码"
                key: "docNum4"
            }
            BizTextInput {
                id: inputDoc5
                formId:"userInfo"
                label: "证件号码"
                key: "docNum5"
            }
            BizTextInput {
                id: inputDoc6
                formId:"userInfo"
                label: "证件号码"
                key: "docNum6"
            }
        }
    }
}
