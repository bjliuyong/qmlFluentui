// BaseLayout/qml/View/ViewUserInfo/ViewUserInfo.qml
import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import "../../LayoutTemplate/TopBottomSplit"
import "../../BizBaseComponent/BaseComp"
Item {
    id: viewUserInfoRoot

    // 使用模板的最小尺寸作为自身的隐式尺寸
    implicitWidth: searchLayout.staticMinWidth
    implicitHeight: searchLayout.staticMinHeight
        LayoutTopBottomSplitDraTabTempl{
        id: searchLayout
        topWeight: 5
        bottomWeight: 71
        bottomRightTopWeight: 45
        bottomRightBottomWeight: 25
        bottomLeftWeight: 2
        bottomRightWeight: 8
        anchors.fill: viewUserInfoRoot

        //头部区域组件
        topContent: RegionBTBSUserInfoTop{
           anchors.fill: parent
           onSearchFormClick: searchForm.open()

        }


        //中间区域组件
        bottomLeftContent: RegionBTBSUserInfoBottomLeft{
            anchors.fill: parent

        }

        bottomRightTopContent: [
                RegionBTBSUserInfoTab{
                        id: userInfo

                },
            RegionBTBSUserInfoTab{
                id: userInfosd

            }

        ]

        // //尾部区域组件
        bottomRightBottomContent:[
                RegionBTBSUserInfoBottomRightBottom{
                    id:regionUserInfoFooter
                        anchors.fill: parent
                },
            RegionBTBSUserInfoTab{
                id: userInforf

            }]


        dialogContent: [
            RegionBTBSUserInfoSearchDialog {
                id: searchForm


            }
        ]

}
    /*
    LayoutTopBottomSplitDraTempl {
        id: searchLayout
        topWeight: 5
        bottomWeight: 71
        bottomRightTopWeight: 45
        bottomRightBottomWeight: 25
        bottomLeftWeight: 2
        bottomRightWeight: 8
        anchors.fill: viewUserInfoRoot

        //头部区域组件
        topContent: RegionBTBSUserInfoTop{
           anchors.fill: parent

        }

*/
        //中间区域组件
        // bottomLeftContent: RegionBTBSUserInfoBottomLeft{
        //     anchors.fill: parent
        // }
        //  bottomRightTopContent: RegionBTBSUserInfoBottomRightTop{
        //     anchors.fill: parent
        //  }

        // bottomRightTopContent: [
        //         RegionBTBSUserInfoTab{

        //         },
        //         RegionBTBSDeptManagerTab{

        //         }

        // ]

        // //尾部区域组件
        // bottomRightBottomContent: RegionBTBSUserInfoBottomRightBottom{
        //     id:regionUserInfoFooter
        //     anchors.fill: parent

        // }

        // dialogContent: [
        //     RegionBTBSUserInfoSearchDialog {
        //         id: searchForm
        //         objectName: "searchForm"
        //         // 【通信】弹窗点击确定 -> View 层捕获 -> 更新 Footer
        //         onConfirmed: () => {

        //             bottomRightTopContent.queryUserList(dialogContent["searchForm"].getFormData("searchForm"))
        //         }
        //     },
        //     RegionBTBSUserBindRoleDialog {
        //         id: userBindRoleForm
        //         objectName: "userBindRoleForm"
        //         // 【通信】弹窗点击确定 -> View 层捕获 -> 更新 Footer
        //         onConfirmed: () => {
        //             bottomRightBottomContent.updateUserBindRoleInfo()
        //         }
        //     }

        // ]
    //}
}
