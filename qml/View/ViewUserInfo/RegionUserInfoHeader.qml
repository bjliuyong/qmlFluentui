// BaseLayout/qml/View/ViewUserInfo/RegionUserInfoHeader.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../../BizComponent"
import "../../LayoutTemplate/HeaderBodyFooter"
import FluentUI
BaseHeaderBodyFooterItem {
    id: root


    RowLayout{

        id: headerItem
        spacing: 10
        anchors.fill: root

        FluFilledButton {
            text: "清屏"
            Layout.preferredWidth: 100
            disabled: rootContent.editStatus

        }

        // TODO完善查询
        FluFilledButton {
            text: "查询"
            Layout.preferredWidth: 100
            disabled: rootContent.editStatus
            onClicked: {
                dialogContent["searchDialog"].open()
            }
        }

        FluFilledButton {
            text: "增加"
            Layout.preferredWidth: 100
            disabled: rootContent.editStatus
            onClicked: function(){
                rootContent.editStatus = true
                var result = footerContent.getFormData("mag")
                console.log("====================",JSON.stringify(result))
            }
        }

        FluFilledButton {
            text: "修改"
            Layout.preferredWidth: 100
            disabled: rootContent.editStatus
            onClicked: rootContent.editStatus = true
        }
        FluFilledButton {
            text: "删除"
            Layout.preferredWidth: 100
            disabled: rootContent.editStatus
        }
        FluFilledButton {
            text: "保存"
            Layout.preferredWidth: 100
            disabled: !rootContent.editStatus
            onClicked: rootContent.editStatus = false
        }
        FluFilledButton {
            text: "取消"
            Layout.preferredWidth: 100
            disabled: !rootContent.editStatus
            onClicked: rootContent.editStatus = false
        }

        FluFilledButton {
            text: "打印"
            Layout.preferredWidth: 100
            disabled: rootContent.editStatus
        }

        FluFilledButton {
            text: "导出"
            disabled: rootContent.editStatus
            Layout.preferredWidth: 100

        }

        FluFilledButton {
            text: "退出"
            disabled: rootContent.editStatus
            Layout.preferredWidth: 100

        }






        // FluFilledButton {
        //     text: "弹窗1"
        //     Layout.preferredWidth: 100
        //     onClicked: ()=>{
        //         // 【调用】通过 ID 访问弹窗
        //         if (root.contextDialogs && root.contextDialogs["editDialog"]) {

        //             root.contextDialogs["editDialog"].openWithData({name: "张三",docNum:"123"})

        //         } else {
        //             console.warn("找不到 editDialog 弹窗！")
        //         }
        //     }
        // }
        // FluFilledButton {
        //     text: "弹窗2"
        //     Layout.preferredWidth: 100
        //     onClicked: ()=>{
        //         if (root.contextDialogs && root.contextDialogs["deleteDialog"]) {
        //             // 调用弹窗的方法
        //             root.contextDialogs["deleteDialog"].open()
        //         } else {
        //             console.warn("找不到 editDialog 弹窗！")
        //         }
        //     }
        // }
        //
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

    }


}
