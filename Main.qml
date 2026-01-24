import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "./qml/View/ViewUserInfo"
Window {
    id: rootWindow
    width: 1024
    height: 768
    visible: true
    visibility: Window.Maximized
    title: "布局设计"

    minimumWidth: viewUser.implicitWidth
    minimumHeight: viewUser.implicitHeight

    ViewUserInfo{
        id: viewUser
        anchors.fill: parent

    }


}
