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

    LayoutTabTemplTest {
        id: searchLayout
        headerWeight: 5
        bodyWeight: 39
        footerWeight: 32
        property bool editStatus: false
        anchors.fill: viewUserInfoRoot

        //头部区域组件
        headerContent: RegionUserInfoHeader{
           // editStatus: searchLayout.editStatus
           anchors.fill: parent
           onOpenSearchForm: searchForm.open()

        }


        //中间区域组件
        bodyContent: [
            RegionUserInfoBody{
                anchors.fill: parent
            }
        ]

        //尾部区域组件
        footerContent: [RegionUserInfoFooter{
            id:regionUserInfoFooter
            editStatus: searchLayout.editStatus

            anchors.fill: parent

        }]

        dialogContent: [
            RegionUserInfoSearchDialog {
                id: searchForm
                objectName: "searchForm"
                // 【通信】弹窗点击确定 -> View 层捕获 -> 更新 Footer
                onConfirmed: () => {

                    bodyContent.queryUserList(dialogContent["searchForm"].getFormData("searchForm"))
                }
            }
        ]

    }
}
