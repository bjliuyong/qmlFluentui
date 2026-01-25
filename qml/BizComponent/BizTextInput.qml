// BaseLayout/qml/BizComponent/BizTextInput.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../BizBaseComponent/BaseComp"

BizBaseLabeledInput {
    id: root

    // 绑定数据属性，供 BizBaseData 自动处理
    inputTarget: textInput
    inputProperty: "text"
    labelRatio: 1
    inputRatio: 3
    tailRatio: 1
    minInputWidth: 100
    content: FluTextBox {
        id: textInput
        anchors.fill: parent
        onTextChanged: root.validInput()
    }
}
