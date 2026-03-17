import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI



FluRadioButtons {
    id: radioGroup
    property var modelName       // 字典表名
    property var jsonObject  // 外部导入Json数组
    property var textRole
    property var valueRole
    property alias dataModel : dataModel
    property var currentValue
    currentIndex: 0
    implicitHeight: 32
    // 设置字典表名后的逻辑
    onModelNameChanged: {
        //console.log("==========================onModelNameChanged this")
        var params = {}
        params.key = modelName
        params.flagType = modelName
        params.enableFlag = "1"
        // commonController.lookupFlagDataQml(params,function(result){
        //     // console.log("==========================onModelNameChanged this enter"+JSON.stringify(result))
        //     if(ServerApiUtil.isOk(result)) {
        //         jsonArrayToList(dataModel,result.data)
        //     } else {
        //         console.log("Result is fail.");
        //     }

        // })
    }
    // 从外部导入Json数组后的逻辑
    onJsonObjectChanged : {
        console.log("onJsonObjectChanged IS CALLED")
        jsonArrayToList(dataModel,jsonObject)
    }

    ListModel {
        id : dataModel
    }

    // 将jsonArray 转化为 ListModel
    function jsonArrayToList(sourceModel, sourceArray) {
        // console.log("jsonArrayToList" + JSON.stringify(sourceArray))
        if(!sourceArray || !Array.isArray(sourceArray)) {
            console.warn("sourceArray 不是有效数组")
            return sourceModel
        }
        sourceModel.clear()

        for(var i = 0; i < sourceArray.length; i++) {
            var sourceItem = sourceArray[i]
            if(sourceItem && typeof sourceItem === "object") {
                sourceModel.append(sourceItem)
            }
        }
        return sourceModel
    }

    // 使用 Repeater 动态生成按钮 布局为什么不生效，待商榷
    Repeater {
        id : radioList
        model: dataModel
        delegate: FluRadioButton {
            verticalPadding : 7
            text: model[textRole]
            checked: index === radioGroup.currentIndex
            size: 20
            Layout.alignment: Qt.AlignVCenter
            onClicked: {
                radioGroup.currentValue = model[valueRole]
                radioGroup.currentIndex = index
            }
        }
    }
}
