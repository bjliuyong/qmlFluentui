// UniversalFormLayout.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "./DataBaseItem.qml"
// 继承自 BaseFormItem，天然拥有 formValue 能力
DataBaseItem {
    id: control

    // =====================================
    // 1. 公共属性接口
    // =====================================
    property string label: "标题"        // 前缀标签文本
    property string tail: ""            // 后缀标签文本
    property bool verifiy: false       // 是否必填（显示红色星号）

    property int labelRatio: 1        // 标签固定宽度，方便对齐
    property int inputRatio: 3        // 标签固定宽度，方便对齐
    property int tailRatio: 1        // 标签固定宽度，方便对齐

    property type name: value

    property int spacing: 10            // 间距
    inputProperty: "test"
    // 【核心】内容插槽：允许子类把具体的输入框塞到中间
    default property alias content: contentSlot.data

    // =====================================
    // 2. 布局实现
    // =====================================
    RowLayout {
        anchors.fill: parent
        spacing: control.spacing

        // --- A. 左侧标签区 ---
        RowLayout {
            Layout.preferredWidth: control.labelWidth
            Layout.alignment: Qt.AlignVCenter
            spacing: 2

            // 必填红星
            Text {
                text: "*"
                color: "red"
                visible: control.required
                font.bold: true
            }
            // 标题文本
            Text {
                text: control.label
                Layout.fillWidth: true
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter
                // 可以加个 color: "grey" 或者跟随主题
            }
        }

        // --- B. 中间内容区 (插槽) ---
        // 这是一个容器，子类放入的 TextField 会出现在这里
        Item {
            id: contentSlot
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        // --- C. 右侧后缀区 (单位) ---
        Text {
            text: control.tail
            visible: control.tail !== "" // 没内容时自动隐藏
            color: "#888888"
            Layout.alignment: Qt.AlignVCenter
        }
    }
}
