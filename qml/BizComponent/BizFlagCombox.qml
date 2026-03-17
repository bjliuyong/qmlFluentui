import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../BizBaseComponent/BaseComp"
import "../FluComponent"


BizBaseLabeledInput {
    id: root


    /* ========= 公共属性 ========= */
    inputTarget: flagCombox                        // 绑定数据属性，供 BizBaseData 自动处理
    inputProperty: "currentValue"                 // 输入属性名
    property alias inputBox : flagCombox
    property var jsonObject      // 外部导入Json对象名 Json对象的格式
    property var modelName       // 模型名称属性
    property var currentIndex : 0   // 列表索引
    property var currentValue    // 字典代码

    property var textRole:"flagName"   // 展示内容需输入的字典key值
    property var valueRole:"flagValue"  // 隐藏内容的key值


    // 重写setValue方法
    function setValue(val) {                         // 设置值函数
        if (val === undefined || val === null) return;

        if (inputTarget) {
            if (inputTarget[inputProperty] !== val) {
                for (var i = 0; i < flagCombox.model.count; i++) {
                      var item = flagCombox.model.get(i);
                      //console.log(item[valueRole] + "====" + val)
                      if(item[valueRole] === val) {
                          currentIndex = i
                      }

                  }
            }
        } else {
            if (value !== val) value = val;
        }
    }
    // 重写function 方法
    function reset(){                                // 重置函数
        currentIndex = -1
    }

    content: FluFlagCombox {                      // 内容插槽，使用FluFlagCombox组件
        id: flagCombox                             // 文本输入组件ID
        anchors.fill: parent                      // 填充父对象
        currentIndex: root.currentIndex
        jsonObject: root.jsonObject
        modelName: root.modelName

        textRole: root.textRole
        valueRole: root.valueRole

    }
}
