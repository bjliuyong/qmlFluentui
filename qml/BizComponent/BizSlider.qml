// BaseLayout/qml/BizComponent/BizSlider.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../BizBaseComponent/BaseComp"

BizBaseLabeledInput {
    id: root

    // 绑定数据属性，供 BizBaseData 自动处理
    // reset() 方法对本控件生效
    inputTarget: slider
    property alias inputBox : slider
    inputProperty: "value"

    content: FluSlider {
        id: slider
        anchors.fill: parent
    }
}
