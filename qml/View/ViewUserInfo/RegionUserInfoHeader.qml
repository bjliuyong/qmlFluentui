// BaseLayout/qml/View/ViewUserInfo/RegionUserInfoHeader.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../../BizComponent"
import "../../BizBaseComponent/BaseComp"
import "../../LayoutTemplate/HeaderBodyFooter"
import FluentUI

BizBaseViewItem {
    id: root
    signal openSearchForm()
    RowLayout {

        id: headerItem
        spacing: 10
        anchors.fill: root

        FluFilledButton {
            text: "清屏"
            Layout.preferredWidth: 100
            disabled: editStatus
        }

        // TODO完善查询
        FluFilledButton {
            text: "查询"
            Layout.preferredWidth: 100
            disabled: editStatus
            onClicked: openSearchForm()
        }

        FluFilledButton {
            text: "增加"
            Layout.preferredWidth: 100
            disabled: editStatus
            onClicked: function () {
                // editStatus = true
                // var result = footerContent.getFormData("mag")
            }
        }

        FluFilledButton {
            text: "修改"
            Layout.preferredWidth: 100
            disabled: editStatus
            onClicked: editStatus = true
        }
        FluFilledButton {
            text: "删除"
            Layout.preferredWidth: 100
            disabled: editStatus
        }
        FluFilledButton {
            text: "保存"
            Layout.preferredWidth: 100
            disabled: !editStatus
            onClicked: editStatus = false
        }
        FluFilledButton {
            text: "取消"
            Layout.preferredWidth: 100
            disabled: !editStatus
            onClicked: editStatus = false
        }

        FluFilledButton {
            text: "打印"
            Layout.preferredWidth: 100
            disabled: editStatus
        }

        FluFilledButton {
            text: "导出"
            disabled: editStatus
            Layout.preferredWidth: 100
        }

        FluFilledButton {
            text: "退出"
            disabled: editStatus
            Layout.preferredWidth: 100
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
