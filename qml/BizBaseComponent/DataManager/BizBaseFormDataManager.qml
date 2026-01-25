import QtQuick

QtObject {
    id: manager

    // 扫描目标（通常是 Region 的 root 或 Dialog 的 contentItem）
    property Item target: null

    // 缓存池：{ "formId1": [comp1, comp2], "formId2": [comp3] }
    property var _cacheMap: ({})

    // ---------------------------------------------------------
    // 内部逻辑：穿透查找 & 缓存构建
    // ---------------------------------------------------------
    function _resolveRealTarget(root) {
        if (!root) return null
        if (root.contentItem && typeof root.contentItem !== "function") {
            return _resolveRealTarget(root.contentItem)
        }
        return root
    }

    function refreshCache() {
        var realTarget = _resolveRealTarget(manager.target)
        if (!realTarget) return

        var newCache = {}

        function scan(node) {
            if (!node) return

            // 判定条件：有 key 且有 setValue 方法的组件
            if (node.hasOwnProperty("key") && node.key !== "" && typeof node.setValue === "function") {

                // 获取 formId (默认为 "default")
                var fid = "default"
                if (node.hasOwnProperty("formId") && node.formId !== "") {
                    fid = node.formId
                }

                if (!newCache[fid]) newCache[fid] = []
                newCache[fid].push(node)
                return // 剪枝
            }

            var kids = node.children
            if (kids) {
                for (var i = 0; i < kids.length; i++) {
                    scan(kids[i])
                }
            }
        }

        console.time("BuildCache")
        scan(realTarget)
        console.timeEnd("BuildCache")
        _cacheMap = newCache
    }

    function _getFields(formId) {
        if (Object.keys(_cacheMap).length === 0) refreshCache()
        var fid = formId || "default"
        return _cacheMap[fid] || []
    }

    // ---------------------------------------------------------
    // 功能 1: 数据存取 (Get / Set)
    // ---------------------------------------------------------
    function setData(data, formId) {
        var fields = _getFields(formId)
        if (!data) return
        for (var i = 0; i < fields.length; i++) {
            var item = fields[i]
            if (data.hasOwnProperty(item.key)) {
                item.setValue(data[item.key])
            }
        }
    }

    function getData(formId) {
        var fields = _getFields(formId)
        var result = {}
        for (var i = 0; i < fields.length; i++) {
            var item = fields[i]
            if (typeof item.getValue === "function") {
                result[item.key] = item.getValue()
            }
        }
        return result
    }

    // ---------------------------------------------------------
    // 功能 2: 状态控制 (Enabled / Visible)
    // ---------------------------------------------------------
    // 批量设置属性（例如全表单禁用）
    function setFormState(formId, properties) {
        var fields = _getFields(formId)
        for (var i = 0; i < fields.length; i++) {
            var item = fields[i]
            for (var prop in properties) {
                if (item.hasOwnProperty(prop)) {
                    item[prop] = properties[prop]
                }
            }
        }
    }

    // 单个字段设置
    function setFieldState(key, properties, formId) {
        var fields = _getFields(formId)
        for (var i = 0; i < fields.length; i++) {
            if (fields[i].key === key) {
                for (var prop in properties) {
                    fields[i][prop] = properties[prop]
                }
                break
            }
        }
    }

    // ---------------------------------------------------------
    // 功能 3: 重置 (Reset)
    // ---------------------------------------------------------
    function resetForm(formId) {
        var fields = _getFields(formId)
        for (var i = 0; i < fields.length; i++) {
            var item = fields[i]
            // 优先调用组件自带的 reset，没有则清空
            if (typeof item.reset === "function") {
                item.reset()
            } else if (typeof item.setValue === "function") {
                item.setValue("")
            }
        }
    }
}
