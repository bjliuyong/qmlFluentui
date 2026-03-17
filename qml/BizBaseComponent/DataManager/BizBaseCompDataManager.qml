import QtQuick
import FluentUI

FocusScope {
    id: baseRoot


    /* ========= 公共属性 ========= */
    required property string key;                    // 必需属性：字段唯一标识符
    property string formId;                 // 必需属性：表单ID
    property bool disabled: false;                  // 可选属性：是否禁用，默认false
    property var value;                             // 可选属性：当前值

    // 配置项（复用之前的逻辑）
    required property Item inputTarget;              // 必需属性：输入控件目标对象
    required property string inputProperty;          // 必需属性：输入控件的属性名
    // 添加验证结果属性
    property string validationMessage: ""
    // 自动绑定逻辑（保持不变）
    Binding {
        target: baseRoot
        property: "value"
        value: (baseRoot.inputTarget && baseRoot.inputProperty) ?
                   baseRoot.inputTarget[baseRoot.inputProperty] : baseRoot.value
        when: baseRoot.inputTarget !== null
    }
    FluInfoBar{
        id:info_bar
        root:baseRoot
    }

    // onValueChanged: _tryValidate()
    // onFormIdChanged: _tryValidate()

    function _tryValidate() {

        if (baseRoot.formId !== "") {
                validInput()
        }

    }

    function validInput(){
        var formData = this.getJson()
        // 调用C++函数
        if(formData[key]!=="")
        {commonController.ruleValidateQml(formId, formData, function(result){
            handleValidationResult(result.data)
        });}
        console.log(formId,getValue(),"1校验通过")
    }
    // 添加验证结果处理方法
    function handleValidationResult(result) {
        validationMessage = ""
        // 处理验证结果，只保存resultLabels
        var resultLabels = result.resultLabels || []
        if (resultLabels.length > 0) {
            validationMessage = resultLabels.join("\n")
            console.log(validationMessage)
            info_bar.showWarning(qsTr(validationMessage))
        } else {
            validationMessage = ""
        }
    }
    //下拉框等需要处理，需要默认值
    function reset(){                                // 重置函数
        setValue("")
    }
    // 复用之前的 getValue/setValue
    function getValue() {                            // 获取值函数
        if (inputTarget) return inputTarget[inputProperty];
        return value;
    }
    function setValue(val) {                         // 设置值函数

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
    function getJson() {                             // 获取JSON格式数据函数
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
    function setJson(fullData) {                     // 设置JSON格式数据函数
        if (!fullData) return;
        // 自动查找属于自己的 key
        if (fullData.hasOwnProperty(key)) {

            setValue(fullData[key]);
        }
    }
}
