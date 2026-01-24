// BaseLayout/qml/BizBaseComponent/BizBaseLabeledInput.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI

BizBaseData {
    id: control

    /* ========= 公共属性 ========= */
    property string label: "标题"
    property string tail: ""
    property bool required: false

    // 比例属性（权重）：默认 1:3:1
    property real labelRatio: 1
    property real inputRatio: 3
    property real tailRatio: 1

    // 【关键修改 1】定义一个放大基数
    // 将比例 (1, 3) 放大为像素 (100px, 300px)，防止被 minWidth (如 60px) 覆盖
    property real _pixelPerRatio: (control.width - spacing) /
                                  (labelRatio+inputRatio+(control.tail==""?0:tailRatio))

    property int minLabelWidth: 0
    property int minInputWidth: 0
    property int minTailWidth: 0

    property int spacing: 10

    // 内容插槽
    default property alias content: contentSlot.data

    implicitHeight: 32
    Layout.fillWidth: true

    /* ========= 布局实现 ========= */
    RowLayout {
        anchors.fill: parent
        spacing: control.spacing

        /* --- A. 左侧标签区 --- */
        RowLayout {
            Layout.fillWidth: true
            implicitWidth: 0
            // 【关键修改 3】乘以基数
            Layout.preferredWidth: control.labelRatio * control._pixelPerRatio
            Layout.minimumWidth: control.minLabelWidth

            spacing: 2

            // ... (内部 FluCopyableText 内容不变) ...
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

        /* --- B. 中间输入区 (插槽) --- */
        Item {
            id: contentSlot
            Layout.fillWidth: true

            // 【关键修改 4】乘以基数
            Layout.preferredWidth: control.inputRatio * control._pixelPerRatio
            Layout.minimumWidth: control.minInputWidth

            Layout.fillHeight: true
            implicitWidth: 0
            onChildrenChanged: {
                for(var i=0; i<children.length; i++) {
                    let child = children[i];
                    if (child && child.hasOwnProperty("anchors")) {
                        child.anchors.fill = contentSlot
                    }
                }
            }
        }

        /* --- C. 右侧后缀区 (单位) --- */
        FluCopyableText {
            text: control.tail
            visible: text !== ""

            Layout.fillWidth: visible

            // 【关键修改 5】乘以基数
            Layout.preferredWidth: visible ? (control.tailRatio * control._pixelPerRatio) : 0
            Layout.minimumWidth: visible ? control.minTailWidth : 0

            color: "#888888"
            verticalAlignment: Text.AlignVCenter
        }
    }
}
