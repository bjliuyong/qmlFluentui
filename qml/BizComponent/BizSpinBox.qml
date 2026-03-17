// BaseLayout/qml/BizComponent/BizSpinBox.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../BizBaseComponent/BaseComp"

BizBaseLabeledInput {
    id: root
    // 默认最大值是99，最小值是0; 只能输入整型号，正负均支持 ;
    // 如果初始设置的value 超过最大值 to，控件自动设置为预置的最大值to
    // reset() 方法对本控件不生效，不能置零
    // 绑定数据属性，供 BizBaseData 自动处理
    inputTarget: spinBox
    inputProperty: "value"
    property alias inputBox : spinBox
    // 设置最小值
    property alias from: spinBox.from
    // 设置最大值
    property alias to: spinBox.to
    // 是否可编辑
    property bool editable: true

    content: FluSpinBox {
        id: spinBox
        anchors.fill: parent
        editable: root.editable
    }
}
