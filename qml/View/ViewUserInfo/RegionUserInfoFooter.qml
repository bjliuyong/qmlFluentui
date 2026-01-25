// BaseLayout/qml/View/ViewUserInfo/RegionUserInfoFooter.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../../BizComponent"
import "../../LayoutTemplate/HeaderBodyFooter"
BaseHeaderBodyFooterItem{
    id: root

    RowLayout {
        id: footerItem
        // 【规范执行】父级是 footerContainer (Item)
        anchors.fill: root


        Layout.margins: 10 // 这里的 margins 对 anchors 无效，但作为 Layout 属性保留无害

        function setDocNum(newDocNum){
            docNum.setValue(newDocNum)
        }
        function setName(newName){
            name.setValue(newName)
        }

        Item { Layout.fillWidth: true } // 占位符，把按钮顶到右边

        BizTextInput {
            id: docNum
            formId: "userForm"
            key: "docNum"
            label: "证件号"

        }


        BizTextInput {
            id: name
            formId: "userForm"
            key: "name"
            label: "姓名"
        }
    }
}
