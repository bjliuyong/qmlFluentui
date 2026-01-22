// import QtQuick
// import QtQuick.Layouts
// import QtQuick.Controls

// ColumnLayout {
//     id: root
//     anchors.fill: parent
//     anchors.margins: 10
//     spacing: 10

//     property alias headerContent: headerSlot.data
//     property alias searchContent: searchSlot.data
//     property alias bodyContent: bodySlot.data
//     property alias footerContent: footerSlot.data

//     // 内部计算函数：确保高度分配准确
//     function getRelHeight(factor) {
//         // 减去 margins 和 spacing 后的净高度比例
//         return (root.height - root.anchors.margins * 2 - root.spacing * 3) * (factor / 100)
//     }

//     GroupBox {
//         title: "Header"
//         Layout.fillWidth: true
//         Layout.preferredHeight: root.getRelHeight(10) // 替代 stretchFactor
//         background: Rectangle { border.color: "#ccc"; radius: 8 }
//         Item {
//             id: headerSlot
//             anchors.fill: parent
//             Text { text: "未插入头部内容"; anchors.centerIn: parent; color: "#999"; visible: headerSlot.children.length === 1 }
//         }
//     }

//     GroupBox {
//         title: "Search"
//         Layout.fillWidth: true
//         Layout.preferredHeight: root.getRelHeight(10)
//         background: Rectangle { border.color: "#2196F3"; radius: 8 }
//         Item {
//             id: searchSlot
//             anchors.fill: parent
//             Text { text: "等待检索模块加载..."; anchors.centerIn: parent; color: "#999"; visible: searchSlot.children.length === 1 }
//         }
//     }

//     GroupBox {
//         title: "Body"
//         Layout.fillWidth: true
//         Layout.preferredHeight: root.getRelHeight(50)
//         background: Rectangle { border.color: "#ccc"; radius: 8 }
//         Item {
//             id: bodySlot
//             anchors.fill: parent
//             Text { text: "暂无数据内容"; anchors.centerIn: parent; color: "#999"; visible: bodySlot.children.length === 1 }
//         }
//     }

//     GroupBox {
//         title: "Footer"
//         Layout.fillWidth: true
//         Layout.preferredHeight: root.getRelHeight(30)
//         background: Rectangle { border.color: "#ccc"; radius: 8 }
//         Item {
//             id: footerSlot
//             anchors.fill: parent
//             Text { text: "底部操作区未就绪"; anchors.centerIn: parent; color: "#999"; visible: footerSlot.children.length === 1 }
//         }
//     }
// }
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

ColumnLayout {
    id: root
    anchors.fill: parent
    anchors.margins: 10
    // spacing 设置为 10，ColumnLayout 会自动从总高度中扣除这些间距再按比例分配
    spacing: 10

    // 暴露插槽
    property alias headerContent: headerSlot.data
    property alias searchContent: searchSlot.data
    property alias bodyContent: bodySlot.data
    property alias footerContent: footerSlot.data

    // --- 第一部分 (10%) ---
    GroupBox {
        title: "Header"
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.preferredHeight: 10 // 对应 10% 权重
        background: Rectangle { border.color: "#ccc"; radius: 8 }

        Item {
            id: headerSlot
            anchors.fill: parent
            Text {
                text: "未插入头部内容"
                anchors.centerIn: parent
                color: "#999"
                visible: headerSlot.children.length === 1
            }
        }
    }

    // --- 第二部分 (10%) - 检索 ---
    GroupBox {
        title: "Search"
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.preferredHeight: 10 // 对应 10% 权重
        background: Rectangle { border.color: "#2196F3"; radius: 8 }

        Item {
            id: searchSlot
            anchors.fill: parent
            Text {
                text: "等待检索模块加载..."
                anchors.centerIn: parent
                color: "#999"
                visible: searchSlot.children.length === 1
            }
        }
    }

    // --- 第三部分 (50%) - 主体 ---
    GroupBox {
        title: "Body"
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.preferredHeight: 50 // 对应 50% 权重
        background: Rectangle { border.color: "#ccc"; radius: 8 }

        Item {
            id: bodySlot
            anchors.fill: parent
            Text {
                text: "暂无数据内容"
                anchors.centerIn: parent
                color: "#999"
                visible: bodySlot.children.length === 1
            }
        }
    }

    // --- 第四部分 (30%) - 底部 ---
    GroupBox {
        title: "Footer"
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.preferredHeight: 30 // 对应 30% 权重
        background: Rectangle { border.color: "#ccc"; radius: 8 }

        Item {
            id: footerSlot
            anchors.fill: parent
            Text {
                text: "底部操作区未就绪"
                anchors.centerIn: parent
                color: "#999"
                visible: footerSlot.children.length === 1
            }
        }
    }
}
