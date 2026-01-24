import QtQuick
import QtQuick.Controls
import "./qml/Layout/SearchLayoutTemplate"

Window {
    id: rootWindow
    width: 1024
    height: 768
    visible: true
    visibility: Window.Maximized
    title: "布局设计"
    minimumWidth: searchLayout.staticMinWidth + searchLayout.spacing * 2
    minimumHeight: searchLayout.staticMinHeight
    SearchLayoutTemplate {
        id: searchLayout
        anchors.fill: parent

    }
}
