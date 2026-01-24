// BaseLayout/qml/BizComponent/BizTextInput.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../BizBaseComponent"

BizBaseLabeledInput {
    id: root

    // 绑定数据属性，供 BizBaseData 自动处理
    inputTarget: textInput
    inputProperty: "text"

    content: FluTextBox {
        id: textInput
        // 【关键修正】父容器是 Item (contentSlot)，必须使用 anchors，不能用 Layout
        anchors.fill: parent


        // 绑定校验逻辑
        onTextChanged: root.validInput()
    }
}
