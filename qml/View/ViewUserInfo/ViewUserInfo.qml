// BaseLayout/qml/View/ViewUserInfo/ViewUserInfo.qml
import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import "../../LayoutTemplate"

Item {
    id: viewUserInfoRoot

    // 使用模板的最小尺寸作为自身的隐式尺寸
    implicitWidth: searchLayout.staticMinWidth
    implicitHeight: searchLayout.staticMinHeight

    LayoutHeaderBodyFooterTempDraggable {
        id: searchLayout
        anchors.fill: viewUserInfoRoot

        //=============================方案A常用信号模板层写好信号和方法
        /*

        onEditStatusChangedAction:function(headerItem, footerItem) {
            console.log("=== 这是从 View 层传入的自定义逻辑 ===")
            // 这里可以直接操作模板传出来的 footerItem
            if (footerItem) {
                console.log("正在操作 Footer...")
                footerItem.setName("来自外部的修改")

            }

            // 甚至可以做一些 View 层特有的逻辑（模板里做不到的）
            // root.showToast("状态已改变")
        }
        */

        //头部区域组件
        headerContent: RegionUserInfoHeader{
           anchors.fill: parent


           //=================方案A非常用信号，view层补充==============
           /*
           onSubmitClicked: (DocNum)=>{
               regionUserInfoFooter.setDocNum(DocNum)
           }
           */
        }


        //中间区域组件
        bodyContent: RegionUserInfoBody{}

        //尾部区域组件
        footerContent: RegionUserInfoFooter{
            id:regionUserInfoFooter

        }
    }
}
