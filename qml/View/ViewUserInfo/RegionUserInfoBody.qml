// BaseLayout/qml/View/ViewUserInfo/RegionUserInfoBody.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI

ColumnLayout {
    id: root

    width: parent.width
    spacing: 10

    Repeater {
        model: 15
        FluRectangle {
            // 父级是 ColumnLayout，使用 Layout
            Layout.fillWidth: true
            height: 60
            color: index % 2 === 0 ? "#f9f9f9" : "#ffffff"
            radius: 4

            FluText {
                text: "表单项 " + (index + 1)
                anchors.centerIn: parent
            }
        }
    }
}
