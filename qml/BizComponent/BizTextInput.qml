// BizDocNumComponent.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../BizBaseComponent"
BizBaseLabeledInput {
    inputTarget: textInput
    inputProperty: "text"

    content: FluTextBox {
        id: textInput
        Layout.fillWidth: true
        Layout.fillHeight: true
        onTextChanged: validInput()
    }
}
