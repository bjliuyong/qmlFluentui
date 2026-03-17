// BaseLayout/qml/BizComponent/BizRadioGroup.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../BizBaseComponent/BaseComp"
import "../FluComponent"
BizBaseLabeledInput {
    id: root
    // TODO 可以正常使用，但是会存在报错提示，待解决
    // Error: Cannot assign to non-existent property "checked"
    // Error: Cannot assign to non-existent property "clickListener"
    // 绑定数据属性，供 BizBaseData 自动处理，接收参数待定
    inputTarget: radioGroup
    inputProperty: "currentValue"
    property alias inputBox      : radioGroup               //
    property alias currentValue  : radioGroup.currentValue  // 当前值，实际的代码
    property alias  currentIndex : radioGroup.currentIndex  // 设置组框初始索引，若索引超出范围，则不选择
    property var modelName                                  // 字典表名
    property alias jsonObject   :  radioGroup.jsonObject                               // 外部传入字典表
    property var orientation : Qt.Horizontal                // 设置组框列表方向，水平/垂直布局
    property var spacing                                    // 设置组框之间的间距
    property var textRole:  "flagName"                      // 展示内容需输入的字典key值
    property var valueRole:  "flagValue"                    // 隐藏内容的key值

    function reset() {
        currentIndex = -1
    }

    function setValue(val) {
        if (val === undefined || val === null) return;
        if (inputTarget) {
            if (inputTarget[inputProperty] !== val) {
                for (var i = 0; i < radioGroup.dataModel.count; i++) {
                    var item = radioGroup.dataModel.get(i);
                    if(item[valueRole] === val) {
                      currentIndex = i
                    }
                }
            }
        } else {
            if (value !== val) value = val;
        }
    }



    content: FluFlagRadioGroup {
                id: radioGroup                             // 文本输入组件ID
                anchors.fill: parent                       // 填充父对象
                modelName: root.modelName
                valueRole: root.valueRole
                textRole: root.textRole
                orientation: root.orientation
                spacing: radioGroup.spacing
            }
}
