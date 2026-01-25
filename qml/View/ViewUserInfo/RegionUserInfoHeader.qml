// BaseLayout/qml/View/ViewUserInfo/RegionUserInfoHeader.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../../BizComponent"
import FluentUI
Item {
    id: root
    signal submitClicked(var DocNum)
    signal changedEditStatus(var name)
    // ===========================方案B，写一个Header的基类
    // property var contextFooter: null
    RowLayout{
        spacing: 10
        anchors.fill: root
        FluFilledButton {
            text: "提交"
            Layout.preferredWidth: 100
            onClicked: function(){
                // root.submitClicked("231")
                //contextFooter.setDocNum("231")
            }
        }

        FluFilledButton {
            text: "取消"
            Layout.preferredWidth: 100
            onClicked: root.changedEditStatus("231")
        }
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

    }


}
