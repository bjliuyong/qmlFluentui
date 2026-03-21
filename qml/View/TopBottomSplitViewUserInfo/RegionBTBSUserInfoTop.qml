// BaseLayout/qml/View/ViewUserInfo/RegionUserInfoHeader.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../../BizComponent"
import "../../LayoutTemplate/TopBottomSplit"
import FluentUI
import "../../BizBaseComponent/BaseComp"
BizBaseViewItem {
    id: root
    signal searchFormClick()
    signal cancle()

    RowLayout{

        id: headerItem
        spacing: 10
        anchors.fill: root

        FluFilledButton {
            text: "清屏"
            Layout.preferredWidth: 100
            // disabled: rootContent.editStatus

        }

        // TODO完善查询
        FluFilledButton {
            text: "查询"
            Layout.preferredWidth: 100
            // disabled: editStatus
            onClicked: searchFormClick()


        }

        FluFilledButton {
            text: "增加"
            Layout.preferredWidth: 100
            // disabled: rootContent.editStatus
            //onClicked: add()
        }

        FluFilledButton {
            text: "修改"
            Layout.preferredWidth: 100
            // disabled: rootContent.editStatus
            //onClicked: edit()
        }

        FluFilledButton {
            text: "保存"
            Layout.preferredWidth: 100
            // disabled: !rootContent.editStatus
            //onClicked: commit()

        }
        FluFilledButton {
            text: "取消"
            Layout.preferredWidth: 100
            // disabled: !rootContent.editStatus
            // disabled: !rootContent.editStatus
            onClicked: cancle()
        }

        FluFilledButton {
            text: "打印"
            Layout.preferredWidth: 100
            // disabled: rootContent.editStatus
            // onClicked: {
            //     bottomRightBottomContent.getSelectRow()
            // }
        }

        FluFilledButton {
            text: "导出"
            // disabled: rootContent.editStatus
            Layout.preferredWidth: 100

        }

        FluFilledButton {
            text: "退出"
            // disabled: rootContent.editStatus
            Layout.preferredWidth: 100

        }

        FluFilledButton {
            text: "测试窗口"
            Layout.preferredWidth: 100
            onClicked: {
                testWindowComp.createObject(root).show()
            }
        }

        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

    }

    Component {
        id: testWindowComp
        FluWindow {
            width: 400
            height: 300
            title: "测试窗口"
            FluText {
                text: "这是一个测试窗口，动画很流畅！"
                anchors.centerIn: parent
                font: FluTextStyle.Title
            }
        }
    }
}
