// BaseLayout/qml/BizComponent/BizTextInput.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../BizBaseComponent/BaseComp"

BizBaseLabeledInput {
    id: root

    // 绑定数据属性，供 BizBaseData 自动处理
    // reset() 方法对本控件生效
    inputTarget: checkBox
    inputProperty: "checked"
    property alias inputBox : checkBox
    // property alias checked: textInput.checked

    content: FluCheckBox {
        id: checkBox
        anchors.fill: parent
    }
}
