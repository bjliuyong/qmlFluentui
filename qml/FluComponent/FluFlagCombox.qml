import QtQuick
import QtQuick.Controls

import FluentUI
FluComboBox {
    id : comboBoxId
    width: 100
    height: 30
    property alias customModel: comboBoxId.model
    property string modelName:""
    property var jsonObject
    onModelNameChanged: {
        getNameAndCode()
    }

    onJsonObjectChanged: {
        console.log("===================>comboBoxIdsys   onJsonObjectChanged")
        customModel = comboBoxId.jsonArrayToList(dataModel,jsonObject)
    }

    // 获取JsonArray字典项数组
    function getNameAndCode() {
        var params = {}
        params.key = modelName
        params.flagType = modelName
        params.enableFlag = "1"
        // commonController.lookupFlagDataQml(params,function(result){
        //     if(ServerApiUtil.isOk(result)) {
        //         console.log("==========================>>>>>>")
        //         console.log(JSON.stringify(result.data))
        //         customModel = comboBoxId.jsonArrayToList(dataModel,result.data)
        //     } else {
        //         console.log("Result is fail.");
        //     }

        // })
    }

    ListModel {
        id: dataModel
    }
    // 将jsonArray 转化为 ListModel
    function jsonArrayToList(sourceModel, sourceArray) {
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
}
