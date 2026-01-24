import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// import "./Bus.js" as Bus

Rectangle {
    id: headerRoot
    anchors.fill: parent
    color: "transparent"
    height: 60

    // 按钮配置数据：可以通过 JS 动态修改
    property var buttonModel: [
        {
            text: "新增",
            icon: "\uE109",
            action: "add"
        },
        {
            text: "导出",
            icon: "\uE158",
            action: "export"
        },
        {
            text: "刷新",
            icon: "\uE117",
            action: "refresh"
        }
    ]

    RowLayout {
        id: headerLayout
        anchors.fill: parent
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        spacing: 10

        Repeater {
            model: headerRoot.buttonModel
            Button {
                Layout.preferredHeight: 35
                // 当宽度非常小时，隐藏文字只显示图标（如果有图标库的话）
                text: headerRoot.width > 600 ? modelData.text : ""
                contentItem: Row {
                    spacing: 5
                    Text {
                        text: modelData.icon
                        font.family: "Segoe Fluent Icons" // 假设使用了图标字体
                        visible: text !== ""
                    }
                    Text {
                        text: modelData.text
                        visible: headerRoot.width > 500 // 窗口太窄时自动隐藏文字
                    }
                }

                onClicked: {
                    // 统一通过 Bus 发送消息
                    Bus.emit(modelData.action + "_clicked", {
                        "keyword": searchInput.text
                    });
                }
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }

}
