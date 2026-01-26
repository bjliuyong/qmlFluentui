

import QtQuick

FocusScope {
    id: baseRoot

    required property string key;
    property string formId;
    property bool disabled: false;
    property var value

    // 配置项（复用之前的逻辑）
    required property Item inputTarget;
    // 控件类型	inputTarget	inputProperty	数据类型	备注
    // TextField	input (本身)	"text"	String	默认情况
    // SpinBox	input (本身)	"value"	Int / Real	数字
    // CheckBox	input (本身)	"checked"	Bool	true / false
    // Switch	input (本身)	"checked"	Bool	同上
    // ComboBox	input (本身)	"currentIndex"	Int	存索引
    // ComboBox	input (本身)	"currentValue"	String	存文本
    // RadioGroup	root (父级)	"currentSelection"	String	需要在父级做一层简单的逻辑转换
    // Slider	input (本身)	"value"	Real	滑块数值
    required property string inputProperty;

    // 自动绑定逻辑（保持不变）
    Binding {
        target: baseRoot
        property: "value"
        value: (baseRoot.inputTarget && baseRoot.inputProperty) ?
               baseRoot.inputTarget[baseRoot.inputProperty] : baseRoot.value
        when: baseRoot.inputTarget !== null
    }

    onValueChanged: _tryValidate()
    onFormIdChanged: _tryValidate()

    function _tryValidate() {
        if (baseRoot.formId !== "") {
                validInput()
        }
    }

    function validInput(){
        // 调用C++函数
        console.log(formId,getValue(),"校验通过")
    }

    //下拉框等需要处理，需要默认值
    function reset(){
        setValue("")
    }

    // 复用之前的 getValue/setValue
    function getValue() {
        if (inputTarget) return inputTarget[inputProperty];
        return value;
    }

    function setValue(val) {
        if (val === undefined || val === null) return;
        if (inputTarget) {
            if (inputTarget[inputProperty] !== val) inputTarget[inputProperty] = val;
        } else {
            if (value !== val) value = val;
        }
    }

    /**
     * getJson()
     * 返回值: 一个标准的 JSON 对象，例如 { "userName": "张三" }
     */
    function getJson() {
        var data = {};
        // 使用 key 作为键，getValue() 作为值
        data[key] = getValue();
        return data;
    }

    /**
     * setJson(fullData)
     * 参数: fullData 是包含所有表单数据的大的 JSON 对象
     * 逻辑: 检查大对象里有没有我的 key，有就取出来赋值
     */
    function setJson(fullData) {
        if (!fullData) return;

        // 自动查找属于自己的 key
        if (fullData.hasOwnProperty(key)) {
            console.log(`[SetJson] ${key} found value: ${fullData[key]}`);
            setValue(fullData[key]);
        }
    }
}
