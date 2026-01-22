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

    SearchLayoutTemplate {
        anchors.fill: parent
        headerContent: Rectangle{
            width: 100
            height: 100
            color: "red"
        }
        bodyContent: Rectangle{
            width: 100
            height: 100
            color: "blue"
        }
    }


}
