import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../BizBaseComponent/BaseComp"


BizBaseLabeledInput {
    id: root


    /* ========= 公共属性 ========= */
    property alias inputBox : textInput
    inputTarget: textInput                        // 绑定数据属性，供 BizBaseData 自动处理
    inputProperty: "checked"                         // 输入属性名

    content: FluToggleSwitch {                    // 内容插槽，使用FluTextBox组件
        id: textInput                             // 文本输入组件ID
        anchors.fill: parent                      // 填充父对象
    }
}
