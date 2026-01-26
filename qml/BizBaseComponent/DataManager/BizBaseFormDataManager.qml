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
    // 返回对象结构: { success: bool, error: string }
        function refreshCache(rootDefaultId) {
            var realTarget = _resolveRealTarget(manager.target)
            if (!realTarget) return { success: true }

            var newCache = {}
            var errorMsg = ""

            // 初始上下文 ID
            var startScope = rootDefaultId || ""

            // === 递归扫描函数 (携带环境 ID) ===
            function scan(node, currentScope) {
                if (!node || errorMsg !== "") return

                // 1. 【核心修正】检查当前节点是否定义了新的作用域
                // 无论它是 Item, Rectangle 还是 GridLayout，只要有 scopeFormId 属性，就切换环境
                var nextScope = currentScope

                // 检测 scopeFormId (容器常用)
                if (node.hasOwnProperty("scopeFormId") && node.scopeFormId !== "") {
                    nextScope = node.scopeFormId
                }
                // 兼容检测 formId (某些组件可能用这个名字)
                else if (node.hasOwnProperty("formId") && node.formId !== "" && !node.hasOwnProperty("key")) {
                    // 注意：如果它有 key，说明它是输入控件，formId 是它自己的归属，而不是它产生的环境
                    // 所以这里加了 !node.hasOwnProperty("key") 判断，只有纯容器的 formId 才算环境
                    nextScope = node.formId
                }

                // 2. 判断是否为“有效的数据输入组件”
                // 特征：有 key 且 有 setValue 方法
                if (node.hasOwnProperty("key") && node.key !== "" && typeof node.setValue === "function") {

                    // === 自动赋值 ===
                    // 如果组件自己没有 formId，就用环境 ID (nextScope)
                    if (node.hasOwnProperty("formId") && node.formId === "") {
                        node.formId = nextScope
                    }

                    // === 报错检查 ===
                    // 最终必须得有个 ID
                    var finalId = (node.hasOwnProperty("formId")) ? node.formId : ""

                    if (finalId === "") {
                        errorMsg = `严重错误: 组件 Key='${node.key}' 未绑定 FormID。\n既没有自身 formId，也没有父级 scopeFormId 环境。`
                        return // 报错中断
                    }

                    // === 归档 ===
                    if (!newCache[finalId]) newCache[finalId] = []
                    newCache[finalId].push(node)

                    // 输入控件内部通常不再包含其他表单控件，剪枝
                    return
                }

                // 3. 递归子节点 (传入新的 scope)
                var kids = node.children
                if (kids) {
                    for (var i = 0; i < kids.length; i++) {
                        // 【关键】这里传下去的是 nextScope (可能是这一层更新过的)
                        scan(kids[i], nextScope)
                    }
                }
            }

            // 开始扫描
            scan(realTarget, startScope)

            if (errorMsg !== "") {
                return { success: false, error: errorMsg }
            }

            _cacheMap = newCache
            return { success: true }
        }

        // ... 辅助函数 ...
        function _resolveRealTarget(item) {
            if (!item) return null
            if (item.contentItem) return item.contentItem
            return item
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
