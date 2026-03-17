import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./qml/View/TopBottomSplitViewUserInfo"
import FluentUI
FluWindow {
    id: rootWindow
    width: 1024
    height: 768
    visible: true

    // 1. 设置窗体标题 (任务栏和窗口预览显示的标题)
    title: "用户管理系统"

    // 2. 配置 FluentUI 的顶部标题栏 (界面左上角显示的图标和标题)
    appBar: FluAppBar {
        title: "用户管理系统"             // 标题
        icon: "qrc:/res/image/logo.png"  // 图标 (请确保路径正确)
        showDark: true                   // 显示暗色模式切换按钮
    }

    leftBar: Rectangle {
        width: 40
        color: FluTheme.backgroundColor
        ColumnLayout {
            anchors.fill: parent
            spacing: 10
            FluIconButton {
                iconSource: FluentIcons.Home
                Layout.alignment: Qt.AlignHCenter
                iconSize: 20
            }
            FluIconButton {
                iconSource: FluentIcons.Contact
                Layout.alignment: Qt.AlignHCenter
                iconSize: 20
            }
            Item { Layout.fillHeight: true }
            FluIconButton {
                iconSource: FluentIcons.Settings
                Layout.alignment: Qt.AlignHCenter
                iconSize: 20
            }
        }
    }

    minimumWidth: viewUser.implicitWidth
    minimumHeight: viewUser.implicitHeight

    // ViewThemeColorsTest{
    //     anchors.fill: parent
    //     id: viewUser
    // }
    ViewBTBSUserInfo{
        anchors.fill:parent

    }


}
