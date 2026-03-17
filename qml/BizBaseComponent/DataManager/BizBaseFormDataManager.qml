import QtQuick


QtObject {
    id: manager


    /* ========= 公共属性 ========= */
    property Item target: null                      // 扫描目标（通常是 Region 的 root 或 Dialog 的 contentItem）
    // 缓存池：{ "formId1": [comp1, comp2], "formId2": [comp3] }
    property var _cacheMap: ({})                   // 内部缓存映射

    // 内部逻辑：穿透查找 & 缓存构建
    // ---------------------------------------------------------
    function refreshCache(rootDefaultId) {
        var realTarget = _resolveRealTarget(manager.target)

        // 【关键修复1】如果目标不存在（如弹窗关闭），必须立即清空缓存
        if (!realTarget) {
            _cacheMap = {}

            return { success: true }
        }

        var newCache = {}
        var errorMsg = ""
        var startScope = rootDefaultId || ""

        // === 递归扫描函数 (逻辑保持不变) ===
        function scan(node, currentScope) {
            if (!node || errorMsg !== "") return
            var nextScope = currentScope
            if (node.hasOwnProperty("scopeFormId") && node.scopeFormId !== "") {
                nextScope = node.scopeFormId
            } else if (node.hasOwnProperty("formId") && node.formId !== "" && !node.hasOwnProperty("key")) {
                nextScope = node.formId
            }

            if (node.hasOwnProperty("key") && node.key !== "" && typeof node.setValue === "function") {
                if (node.hasOwnProperty("formId") && node.formId === "") {
                    node.formId = nextScope
                }
                var finalId = (node.hasOwnProperty("formId")) ? node.formId : ""
                if (finalId === "") {
                    errorMsg = `严重错误: 组件 Key='${node.key}' 未绑定 FormID。`
                    return
                }
                if (!newCache[finalId]) newCache[finalId] = []
                newCache[finalId].push(node)
                return
            }

            // 扫描resources中的数据管理控件
            var res = node.resources
            if(res){
                for(var j = 0;j<res.length;j++){
                    scan(res[j],nextScope)
                }
            }

            var kids = node.children
            if (kids) {
                for (var i = 0; i < kids.length; i++) {
                    scan(kids[i], nextScope)
                }
            }
        }

        scan(realTarget, startScope)

        if (errorMsg !== "") {
            console.error(errorMsg)
            return { success: false, error: errorMsg }
        }


        _cacheMap = newCache
        return { success: true }
    }

    // 【关键修复2】智能获取字段列表（带僵尸检测）
    function _getFields(formId) {
        var fid = formId || "default"
        var items = _cacheMap[fid]

        // 判断是否需要刷新
        var needRefresh = false

        if (!items || items.length === 0) {
            // A. 缓存为空，可能是第一次加载或被清空
            needRefresh = true
        } else {
            // B. 缓存不为空，但检测对象是否已销毁 (Zombie Check)
            // 取第一个元素检查，如果它丢失了 getValue 方法，说明整个列表都指向了已销毁的 QML 对象
            var firstItem = items[0]
            if (typeof firstItem.getValue !== "function") {

                needRefresh = true
            }
        }

        if (needRefresh) {
            refreshCache() // 重新扫描当前 target
            items = _cacheMap[fid]
        }

        return items || []
    }

    function _resolveRealTarget(item) {
        if (!item) return null
        // 兼容某些组件套了一层 contentItem 的情况
        if (item.contentItem && !item.hasOwnProperty("key")) return item.contentItem
        return item
    }

    // ---------------------------------------------------------
    // 公共统一 API (ViewItem 和 DialogItem 共享)
    // ---------------------------------------------------------
    function setData(data, formId) {
        var fields = _getFields(formId)
        if (!data) return
        for (var i = 0; i < fields.length; i++) {
            console.log("-----------------",fields[i].key,JSON.stringify(data),data.hasOwnProperty(fields[i].key))
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

    function setFormState(formId, properties) {
        var fields = _getFields(formId)
        for (var i = 0; i < fields.length; i++) {
            var item = fields[i]
            for (var prop in properties) {
                if (item.hasOwnProperty(prop)) item[prop] = properties[prop]
            }
        }
    }

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

    function resetForm(formId) {
        var fields = _getFields(formId)
        for (var i = 0; i < fields.length; i++) {
            var item = fields[i]
            if (typeof item.reset === "function") {
                item.reset()
            } else {
                // 否则尝试调用 setValue 设置空值
                if (typeof item.setValue === "function") {
                    item.setValue("")
                }
            }
        }
    }

    /**
      重置表单选项值，支持忽略不重置入参keysStr包含的key对应选项
     */
    function resetFormIgnore(formId, keysStr) {
        var fields = _getFields(formId)
        for (var i = 0; i < fields.length; i++) {
            var item = fields[i]
            if (keysStr.indexOf("," + item.key + ",") > -1) {
                continue
            }

            if (typeof item.reset === "function") {
                item.reset()
            } else {
                // 否则尝试调用 setValue 设置空值
                if (typeof item.setValue === "function") {
                    item.setValue("")
                }
            }
        }
    }
}
