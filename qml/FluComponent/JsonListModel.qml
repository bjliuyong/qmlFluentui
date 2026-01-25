// JsonListModel.qml
import QtQuick 2.15

ListModel {
    id: root

    // 源数据属性
    property var sourceArray: []

    // // 字段映射
    // property var fieldMapping: ({})

    // 数据转换函数
    property var transformFunction: null

    // 监听源数据变化
    onSourceArrayChanged: {
        updateFromSource()
    }

    // 更新模型
    function updateFromSource() {
        clear()

        if (!sourceArray || !Array.isArray(sourceArray)) {
            console.warn("sourceArray 不是有效数组")
            return
        }

        for (var i = 0; i < sourceArray.length; i++) {
            var sourceItem = sourceArray[i]

            // 应用转换函数（如果提供）
            var modelItem = transformFunction ?
                transformFunction(sourceItem, i) :
                sourceItem

            // // 应用字段映射
            // if (fieldMapping && typeof fieldMapping === 'object') {
            //     modelItem = applyFieldMapping(modelItem)
            // }

            if (modelItem && typeof modelItem === 'object') {
                append(modelItem)
            }
        }
    }

    // // 应用字段映射
    // function applyFieldMapping(item) {
    //     var mappedItem = {}
    //     for (var key in item) {
    //         if (fieldMapping[key] !== undefined) {
    //             mappedItem[fieldMapping[key]] = item[key]
    //         } else {
    //             mappedItem[key] = item[key]
    //         }
    //     }
    //     return mappedItem
    // }

    function findCodeOrKey(label) {
        for (var i = 0; i < count; i++) {
            var result = {}
            console.log(get(i).name)
            if(get(i).name === label) {
                    result.type = "code"
                    result.value = get(i).code
                    return result
                }
            if(get(i).code === label) {
                    result.type = "name"
                    result.value = get(i).name
                    return result
                }
            }
        var err = {}
        err.type = "null"
        return err
            }

    // 查找项目
    function find(callback) {
        for (var i = 0; i < count; i++) {
            if (callback(get(i), i)) {
                return get(i)
            }
        }
        return null
    }

    // 根据字段值查找
    function findByField(fieldName, fieldValue) {
        return find(function(item) {
            return item[fieldName] === fieldValue
        })
    }
}
