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
    inputProperty: "curIDNum"                 // 输入属性名
    property alias jsonObject   : textInput.jsonObject     // 外部导入Json对象名 Json对象的格式
    property alias currentIndex : textInput.currentIndex   // 列表索引
    property alias curUserID    : textInput.curUserID   // 警号
    property alias curIDNum     : textInput.curIDNum   // 身份证号
    property alias curName      : textInput.curName   // 姓名
    property alias showUserID   : textInput.showUserID   // 是否显示警号
    property alias showIDNum    : textInput.showIDNum   // 是否显示身份证号
    property alias showName     : textInput.showName   // 是否显示姓名
    property alias deptCode     : textInput.deptCode     // 所属部门代码，用于过滤用户信息
    property alias dataQueryWay : textInput.dataQueryWay     // 下拉框内容查询途径 1redis查询，2后端接口直接查数据库
    property alias expandUpward         : textInput.expandUpward        // 下拉框是否向上展开
    property alias autoExpandDirection  : textInput.autoExpandDirection     // 是否自动决定展开方向
    property alias needEmptyOption      : textInput.needEmptyOption     // 是否需要空选项
    property alias initLoadData         : textInput.initLoadData     // 是否组件初始化完成后加载用户数据

    property alias popupHeight          : textInput.popupHeight     // 自定义下拉列表区域的高度
    property alias popupWidth           : textInput.popupWidth     // 自定义下拉列表区域的宽度，值小于输入框宽度时默认使用输入框宽度


    content: FluUserComboBox {                    // 内容插槽，使用FluFlagCombox组件
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
