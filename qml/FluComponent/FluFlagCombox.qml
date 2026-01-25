import QtQuick
import QtQuick.Controls
import FluentUI
FluComboBox {
    id : comboBoxId
    width: 100
    height: 30
    textRole: "name"
    valueRole: "code"
    property var modelName:""
    onModelNameChanged: {
      console.log("===================================")
      cityModel.sourceArray = getNameAndCode(modelName)
      customModel =  cityModel
    }

    property alias customModel: comboBoxId.model
    // 加载字典项
    property var dict: {
      "placeCode": [
        {
          "name": "北京市",
          "code": "110000"
        },
        {
          "name": "上海市",
          "code": "310000"
        },
        {
          "name": "广州市",
          "code": "440100"
        },
        {
          "name": "深圳市",
          "code": "440300"
        },
        {
          "name": "成都市",
          "code": "510100"
        },
        {
          "name": "天津市",
          "code": "120000"
        },
        {
          "name": "重庆市",
          "code": "500000"
        },
        {
          "name": "杭州市",
          "code": "330100"
        },
        {
          "name": "南京市",
          "code": "320100"
        },
        {
          "name": "武汉市",
          "code": "420100"
        },
        {
          "name": "西安市",
          "code": "610100"
        },
        {
          "name": "沈阳市",
          "code": "210100"
        },
        {
          "name": "哈尔滨市",
          "code": "230100"
        },
        {
          "name": "昆明市",
          "code": "530100"
        },
        {
          "name": "乌鲁木齐市",
          "code": "650100"
        }
      ],
      "genderCode": [
        {
          "name": "男",
          "code": "1"
        },
        {
          "name": "女",
          "code": "2"
        },
        {
          "name": "其他",
          "code": "9"
        }
      ]
    }

    // 获取JsonArray字典项数组
    function getNameAndCode(name) {
      var result = dict[name]
      return Array.isArray(result) ? result : []
    }

    //JsonArray转化为ListModel的对象
    JsonListModel {
        id: cityModel
    }

    function findCodeOrKey(label) {
        return cityModel.findCodeOrKey(label)
    }
    function findByField(fieldName, fieldValue) {
        return cityModel.findByField(fieldName, fieldValue)
    }
}
