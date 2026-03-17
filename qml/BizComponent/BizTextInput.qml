import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../BizBaseComponent/BaseComp"


BizBaseLabeledInput {
    id: root

    /* ========= 公共属性 ========= */
    property alias inputBox : textInput
    property int inputTextSize: FluTextStyle.Body.pixelSize
    property string inputTextFamily: FluTextStyle.Body.family
    inputTarget: textInput                        // 绑定数据属性，供 BizBaseData 自动处理
    inputProperty: "text"                         // 输入属性名
       property alias readOnly: textInput.readOnly

    content: FluTextBox {                         // 内容插槽，使用FluTextBox组件
        id: textInput                             // 文本输入组件ID
        anchors.fill: parent                      // 填充父对象
        font.pixelSize: inputTextSize
        font.family: inputTextFamily
        leftPadding: 12
        rightPadding: 12
        topPadding: 0
        bottomPadding: 0
        cleanEnabled: false
        onTextChanged: {
            text=text.toUpperCase()
        }
    }
}
