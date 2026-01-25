// BaseLayout/qml/View/ViewUserInfo/ViewUserInfo.qml
import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import "../../LayoutTemplate/HeaderBodyFooter"
import "../../BizBaseComponent/BaseComp"
Item {
    id: viewUserInfoRoot

    // 使用模板的最小尺寸作为自身的隐式尺寸
    implicitWidth: searchLayout.staticMinWidth
    implicitHeight: searchLayout.staticMinHeight

    LayoutHeaderBodyFooterTempDraggable {
        id: searchLayout


        anchors.fill: viewUserInfoRoot

        //头部区域组件
        headerContent: RegionUserInfoHeader{
           anchors.fill: parent
        }


        //中间区域组件
        bodyContent: RegionUserInfoBody{
            anchors.fill: parent
        }

        //尾部区域组件
        footerContent: RegionUserInfoFooter{
            id:regionUserInfoFooter
            anchors.fill: parent

        }
        // ===========================弹框
        ///*
        dialogContent: [
            RegionUserInfoEditDialog {
                id: editDialog
                objectName: "editDialog"
                // 【通信】弹窗点击确定 -> View 层捕获 -> 更新 Footer
                onConfirmed: (data) => {
                    console.log("弹窗返回数据:", JSON.stringify(data))

                    // 操作 Footer 组件更新界面
                    regionUserInfoFooter.setName(data.name)
                    regionUserInfoFooter.setDocNum(data.docNum)

                    // 也可以在这里调用 Body 的刷新方法
                    // bodyContentItem.refresh()
                }
            },

            // 如果有其他弹窗，继续添加
            BizBaseDialogItem {
                id: deleteConfirmDialog
                objectName: "deleteDialog"
                title: "确认删除？"
                message: "删除后无法恢复"
                onConfirmed: console.log("执行删除逻辑...")
            }
        ]
        //*/
    }
}
