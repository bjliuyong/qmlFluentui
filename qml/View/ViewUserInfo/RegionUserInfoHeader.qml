// BaseLayout/qml/View/ViewUserInfo/RegionUserInfoHeader.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../../BizComponent"
import "../../LayoutTemplate/HeaderBodyFooter"
import FluentUI
BaseHeaderBodyFooterItem {
    id: root

    property var contextDialogs: null
    RowLayout{
        id: headerItem
        spacing: 10
        anchors.fill: root
        FluFilledButton {
            text: "提交"
            Layout.preferredWidth: 100
            onClicked: function(){
                contextFooter.setDocNum("231")
            }
        }

        FluFilledButton {
            text: "取消"
            Layout.preferredWidth: 100
            onClicked: root.changedEditStatus("231")
        }


        FluFilledButton {
            text: "弹窗1"
            Layout.preferredWidth: 100
            onClicked: ()=>{
                // 【调用】通过 ID 访问弹窗
                if (root.contextDialogs && root.contextDialogs["editDialog"]) {

                    root.contextDialogs["editDialog"].openWithData({name: "张三",docNum:"123"})

                } else {
                    console.warn("找不到 editDialog 弹窗！")
                }
            }
        }
        FluFilledButton {
            text: "弹窗2"
            Layout.preferredWidth: 100
            onClicked: ()=>{
                if (root.contextDialogs && root.contextDialogs["deleteDialog"]) {
                    // 调用弹窗的方法
                    root.contextDialogs["deleteDialog"].open()
                } else {
                    console.warn("找不到 editDialog 弹窗！")
                }
            }
        }
        //*/
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

    }


}
