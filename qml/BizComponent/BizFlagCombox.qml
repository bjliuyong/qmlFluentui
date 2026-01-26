// BaseLayout/qml/BizComponent/BizTextInput.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../BizBaseComponent/BaseComp"
import "../FluComponent"
BizBaseLabeledInput {
    id: root

    // 绑定数据属性，供 BizBaseData 自动处理
    inputTarget: textInput
    inputProperty: "currentValue"
    property var modelName
    labelRatio: 1
    inputRatio: 6
    tailRatio: 1
    minInputWidth: 100
    //TODO 为什么不能写property var modelName：textInput.modelName
    // 不会触发changed信号
    content: FluFlagCombox {
        id: textInput
        anchors.fill: parent
        modelName: root.modelName
    }
}
