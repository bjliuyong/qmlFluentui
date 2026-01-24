// // // UniversalFormLayout.qml
// // import QtQuick
// // import QtQuick.Layouts
// // import QtQuick.Controls
// // import FluentUI
// // // 继承自 BaseFormItem，天然拥有 formValue 能力
// // DataBaseItem {
// //     id: control

// //     // =====================================
// //     // 1. 公共属性接口
// //     // =====================================
// //     property string label: "标题"        // 前缀标签文本
// //     property string tail: ""            // 后缀标签文本
// //     property bool verifiy: false       // 是否必填（显示红色星号）

// //     property int labelRatio: 1        // 标签固定宽度，方便对齐
// //     property int inputRatio: 3        // 标签固定宽度，方便对齐
// //     property int tailRatio: 1        // 标签固定宽度，方便对齐



// //     property int spacing: 10            // 间距

// //     // 【核心】内容插槽：允许子类把具体的输入框塞到中间
// //     default property alias content: contentSlot.data

// //     // =====================================
// //     // 2. 布局实现
// //     // =====================================
// //     RowLayout {
// //         anchors.fill: parent
// //         spacing: control.spacing

// //         // --- A. 左侧标签区 ---
// //         RowLayout {
// //             Layout.preferredWidth: control.labelWidth
// //             Layout.alignment: Qt.AlignVCenter
// //             spacing: 2

// //             // 必填红星
// //             FluCopyableText {
// //                 text: "*"
// //                 color: "red"
// //                 visible: control.required
// //                 font.bold: true
// //             }
// //             // 标题文本
// //             FluCopyableText {
// //                 text: control.label
// //                 Layout.fillWidth: true

// //                 verticalAlignment: Text.AlignVCenter
// //                 // 可以加个 color: "grey" 或者跟随主题
// //             }
// //         }

// //         // --- B. 中间内容区 (插槽) ---
// //         // 这是一个容器，子类放入的 TextField 会出现在这里
// //         Item {
// //             id: contentSlot
// //             Layout.fillWidth: true
// //             Layout.fillHeight: true
// //         }

// //         // --- C. 右侧后缀区 (单位) ---
// //         FluCopyableText {
// //             text: control.tail
// //             visible: control.tail !== "" // 没内容时自动隐藏
// //             color: "#888888"
// //             Layout.alignment: Qt.AlignVCenter
// //         }
// //     }
// // }
// // BizBaseComponent.qml



// BizBaseComponent.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI

BizBaseData {
    id: control

    property string label: "标题"
    property string tail: ""
    property bool required: false

    // 比例属性（权重）
    property real labelRatio: 1
    property real inputRatio: 3
    property real tailRatio: 1

    // 最小宽度限制（防止比例过小时内容重叠）
    property int minLabelWidth: 60
    property int minInputWidth: 120
    property int minTailWidth: 40

    property int spacing: 10
    default property alias content: contentSlot.data

    implicitHeight: 32
    Layout.fillWidth: true

    RowLayout {
        anchors.fill: parent
        spacing: control.spacing

        /* --- 左侧标签 --- */
        RowLayout {
            // 关键点：设置 fillWidth 并将 preferredWidth 设为比例
            Layout.fillWidth: true
            Layout.preferredWidth: control.labelRatio
            Layout.minimumWidth: control.minLabelWidth

            spacing: 2

            FluCopyableText {
                text: "*"
                color: "red"
                visible: control.required
                font.bold: true
            }

            FluCopyableText {
                text: control.label
                Layout.fillWidth: true

                verticalAlignment: Text.AlignVCenter
            }
        }

        /* --- 中间输入区 --- */
        Item {
            id: contentSlot
            Layout.fillWidth: true
            Layout.preferredWidth: control.inputRatio
            Layout.minimumWidth: control.minInputWidth
            Layout.fillHeight: true

            // 强制子代填充插槽
            onChildrenChanged: {
                for(var i=0; i<children.length; i++) {
                    children[i].anchors.fill = contentSlot
                }
            }
        }

        /* --- 右侧单位 --- */
        FluCopyableText {
            text: control.tail
            // 只有当有内容时才参与布局比例分配
            visible: text !== ""

            Layout.fillWidth: visible
            Layout.preferredWidth: visible ? control.tailRatio : 0
            Layout.minimumWidth: visible ? control.minTailWidth : 0

            color: "#888888"
            verticalAlignment: Text.AlignVCenter
        }
    }
}
