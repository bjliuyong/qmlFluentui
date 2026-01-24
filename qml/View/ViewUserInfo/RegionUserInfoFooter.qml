// BaseLayout/qml/View/ViewUserInfo/RegionUserInfoFooter.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI

RowLayout {
    id: root
    // 【规范执行】父级是 footerContainer (Item)
    anchors.fill: parent

    Layout.margins: 10 // 这里的 margins 对 anchors 无效，但作为 Layout 属性保留无害

    Item { Layout.fillWidth: true } // 占位符，把按钮顶到右边

    FluButton {
        text: "提交"
        Layout.preferredWidth: 100
        Layout.fillHeight: true
        onClicked: console.log("提交")
    }

    FluButton {
        text: "取消"
        Layout.preferredWidth: 100
        Layout.fillHeight: true
    }
}
