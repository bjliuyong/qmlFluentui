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

    property bool isLogin: true

    leftBar: Rectangle {
        width: 40
        visible: opacity > 0
        opacity: isLogin ? 0 : 1
        Behavior on opacity {
            NumberAnimation { duration: 500; easing.type: Easing.OutCubic }
        }
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

    // minimumWidth: viewUser.implicitWidth
    // minimumHeight: viewUser.implicitHeight

    // --- 启动时的自动登录页面 ---
    Rectangle {
        id: loginOverlay
        anchors.fill: parent
        z: 9999
        color: FluTheme.backgroundColor
        visible: opacity > 0
        opacity: isLogin ? 1 : 0
        Behavior on opacity {
            NumberAnimation { duration: 500; easing.type: Easing.OutCubic }
        }
        
        // 拦截底层点击和滚动事件
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onWheel: {}
        }

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 24
            
            FluProgressRing {
                Layout.alignment: Qt.AlignHCenter
                width: 60
                height: 60
                strokeWidth: 5
            }
            
            FluText {
                text: "工作站登录中..."
                font: FluTextStyle.Title
                Layout.alignment: Qt.AlignHCenter
            }
        }

        // 模拟自动登录的耗时过程，等待后进入主页
        Timer {
            interval: 2000
            running: true
            onTriggered: {
                isLogin = false
            }
        }
    }

    // --- 真是主页面业务 ---
    ViewBTBSUserInfo{
        anchors.fill: parent
        visible: opacity > 0
        opacity: isLogin ? 0 : 1
        Behavior on opacity {
            NumberAnimation { duration: 500; easing.type: Easing.OutCubic }
        }
    }
    
    FluIconButton {
        iconSource: FluentIcons.Wifi
        text: "清空"
        visible: opacity > 0
        opacity: isLogin ? 0 : 1
        Behavior on opacity {
            NumberAnimation { duration: 500; easing.type: Easing.OutCubic }
        }
        display: Button.TextBesideIcon
        iconColor: "red"
    }
}
