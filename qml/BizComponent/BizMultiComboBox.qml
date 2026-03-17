import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../BizBaseComponent/BaseComp"
import "../FluComponent"


BizBaseLabeledInput {
    id: root


    /* ========= 公共属性 ========= */
    property int inputTextSize: FluTextStyle.Body.pixelSize
    property string inputTextFamily: FluTextStyle.Body.family
    property alias inputBox : textInput
    inputTarget: textInput                        // 绑定数据属性，供 BizBaseData 自动处理
    inputProperty: "currentValue"                 // 输入属性名
    property alias jsonObject   : textInput.jsonObject     // 外部导入Json对象名 Json对象的格式
    property alias modelName    : textInput.modelName      // 模型名称属性
    property alias currentValue : textInput.currentValue   // 字典代码
    property alias currentText  : textInput.currentText    // 字典描述
    property alias textRole     : textInput.textRole      // 展示内容需输入的字典key值
    property alias valueRole    : textInput.valueRole     // 隐藏内容的key值
    property alias comboTextType        : textInput.comboTextType     // 下拉框展示文本的样式  1：只展示text，2：展示value-text，3：只展示value
    property alias modelTableType       : textInput.modelTableType     // 下拉框内容查询字典表还是代码表 1字典表，2代码表
    property alias codeTableFilterVal   : textInput.codeTableFilterVal     // 代码表数据过滤标识，告知通过哪个字段获取指定值结果
    property alias notShowCodes         : textInput.notShowCodes     // 不希望展示的选项code值
    property alias expandUpward         : textInput.expandUpward        // 下拉框是否向上展开
    property alias autoExpandDirection  : textInput.autoExpandDirection     // 是否自动决定展开方向
    property alias orderByColumn        : textInput.orderByColumn     // 选项排序字段名称
    property alias orderBy              : textInput.orderBy     // 排序顺序

    property alias popupHeight          : textInput.popupHeight     // 自定义下拉列表区域的高度
    property alias popupWidth           : textInput.popupWidth     // 自定义下拉列表区域的宽度，值小于输入框宽度时默认使用输入框宽度


    content: FluMultiComboBox {                    // 内容插槽，使用FluFlagCombox组件
        id: textInput                             // 文本输入组件ID
        anchors.fill: parent                      // 填充父对象
        searchBox.font.pixelSize: inputTextSize
        searchBox.font.family: inputTextFamily
        searchBox.leftPadding: 12
        searchBox.rightPadding: 12
        searchBox.topPadding: 5
        searchBox.bottomPadding: 5
    }
}
