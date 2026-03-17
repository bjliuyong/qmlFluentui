import QtQuick
import QtQuick.Controls

import FluentUI
import QtQuick.Templates as T

/**
 * @file FluSearchableCombox.qml
 * @brief 自定义单选下拉框组件：
 *        1、通过“modelName”属性赋值字典类型代码或代码表名称，下拉框组件会自动从数据库获取相应字典选项加载到下拉框；
            “modelTableType”属性赋值1查询字典表，赋值2查询“modelName”属性指定的代码表
            “textRole”属性需填入字典值字段名称，“valueRole”属性需填入字典代码字段名称。通过鼠标或键盘上下按钮选择选项
 *        2、组件提供模糊查询功能，在输入框输入信息，组件会过滤出字典代码或字典描述符合条件的选项提供选择；当出现唯一匹配选项时，自动选中选项并关闭下拉框
 *        3、通过“comboTextType”属性控制下拉框展示文本的样式  1：只展示text，2：展示value-text，3：只展示value
 *        4、通过“autoExpandDirection”属性关闭自适应后，可通过“expandUpward”属性决定下拉框向上还是向下展开
 *        5、通过“codeTableFilterVal”属性可以过滤代码表记录数据，例如“biis_biz_endorse_type_code”签注种类代码表只需要加载“endoseType”字段值为1的记录数据，
            “codeTableFilterVal”属性赋值"endoseType,1"即可
          6、通过popupHeight、popupWidth 属性控制下拉框列表区域高度和宽度
 * @author 邓玉荣
 * @date 2026-01-31
 */

Item {
    id : searchableCombox
    width: 100
    height: 28
    enabled: !disabled
    property string modelName: ""
    property var jsonObject
    property var itemObject: null     // 自定义选项，往下拉列表第一行插入自定义选项
    property string currentValue: ""
    property string currentText: ""
    property int currentIndex: -1
    property string textRole: ""
    property string valueRole: ""
    // 下拉框展示文本的样式  1：只展示text，2：展示value-text，3：只展示value
    property int comboTextType: 2
    // 下拉框内容查询字典表还是代码表 1字典表，2代码表
    property int modelTableType: 1
    // 代码表数据过滤标识，告知通过哪个字段获取指定值结果
    property string codeTableFilterVal: ""    // 样例 "endoseType,1":biis_biz_endorse_type_code表的endoseType字段值为1的结果
    // 不希望展示的选项code值
    property string notShowCodes: ""    // 样例 ",1,2,3," 不展示code=1/2/3的选项，字符串前后必须加上英文逗号
    property string orderByColumn: ""    // 选项排序字段名称
    property string orderBy: "asc"    // 排序顺序

    property bool expandUpward: false   // 下拉框是否向上展开
    property bool autoExpandDirection: true   // 是否自动决定展开方向
    property bool needEmptyOption: false   // 是否需要空选项
    property int popupHeight: 150   // 自定义下拉列表区域的高度
    property int popupWidth: 0      // 自定义下拉列表区域的宽度，值小于输入框宽度时默认使用输入框宽度
    property alias searchBox: searchBox

    // 获取当前选中项所有属性信息的信号
    signal selectedOptionObj(var currentObj)

    property var sourceDataModel: []

    ListModel {
        id: dataModel
    }
    ListModel {
        id: filteredModel
    }

    FluTextBox {
        id: searchBox
        width: parent.width
        // placeholderText: "请选择"
        selectByMouse: true
        activeFocusOnPress: true
        rightPadding: 40

        // 添加一个属性来跟踪是否应该执行唯一选项自动匹配
        property bool shouldAutoSelect: true
        property bool onClickSelect: false   // 用于界面选择和后台动态赋值冲突处理

        // FluTextBox组件的清除图标替换成下拉框的向下箭头图标
        cleanEnabled: false
        FluIcon {
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 12
            iconSource: popup.visible ? FluentIcons.ChevronUp : FluentIcons.ChevronDown
            iconSize: 15
            opacity: enabled ? 1 : 0.3

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    if(popup.visible) {
                        popup.close()
                    } else {
                        filteredModelAppend()
                        popup.open()
                    }
                }
            }
        }

        onActiveFocusChanged: {
            if (activeFocus && !popup.visible) {
                filteredModelAppend()
                popup.open()
            }
        }
        onTextChanged: {
            if (activeFocus && text !== getShowText(currentValue, currentText)) {
                filteredModel.clear()
                if(text === "" || text === null) {
                    searchableCombox.currentValue = ""
                    // 如果文本为空，显示所有选项
                    filteredModelAppend()
                    popup.open()
                } else {
                    // 过滤匹配的选项
                    const searchLower = text.toLowerCase()
                    for(let j = 0; j < dataModel.count; j++) {
                        const item = dataModel.get(j)
                        const textLower = item[textRole].toLowerCase()
                        const valueLower = item[valueRole].toLowerCase()
                        const textMatch = textLower.includes(searchLower)
                        const valueMatch = valueLower.includes(searchLower)
                        if(textMatch || valueMatch) {
                            filteredModel.append(item)
                        }
                    }
                    // 检查是否只有一个选项，如果是则自动选中
                    if(filteredModel.count === 1 && searchBox.shouldAutoSelect){
                        const singleItem = filteredModel.get(0)
                        setSelectedVal(singleItem)
                        popup.close()
                    } else {
                        popup.open()
                    }
                }
                Qt.callLater(function(){
                    searchBox.forceActiveFocus()
                })
            }
        }
        Keys.onPressed: (event) => {
            if(event.key === Qt.Key_Down) {
                if(!popup.visible) {
                    // 如果列表未显示，先显示列表
                    filteredModelAppend()
                    popup.open()
                }
                // 移动到下一个选项
                if(listView.currentIndex < listView.count - 1) {
                    listView.currentIndex++
                }else{
                    listView.currentIndex = 0 // 循环回到顶部
                }
                popup.forceActiveFocus()
                event.accepted = true
            } else if(event.key === Qt.Key_Up) {
                if(!popup.visible) {
                    // 如果列表未显示，先显示列表
                    filteredModelAppend()
                    popup.open()
                }
                // 移动到上一个选项
                if(listView.currentIndex > 0) {
                    listView.currentIndex--
                }else{
                    listView.currentIndex = listView.count - 1 // 循环到底部
                }
                popup.forceActiveFocus()
                event.accepted = true
            } else if(event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                // 回车确认选中当前高亮的选项
                if(popup.visible && listView.currentIndex >= 0) {
                    const item = filteredModel.get(listView.currentIndex)
                    if(item) {
                        setSelectedVal(item)
                        popup.close()
                    }
                }
                event.accepted = true
            } else if(event.key === Qt.Key_Escape || event.key === Qt.Key_Tab) {
                // ESC键隐藏列表
                popup.close()
            } else if(event.key === Qt.Key_Backspace || event.key === Qt.Key_Delete) {
                // 退格或删除时，临时禁用自动选择
                searchBox.shouldAutoSelect = false
                Qt.callLater(function(){
                    // 在下一个事件循环恢复自动选择功能
                    searchBox.shouldAutoSelect = true
                })
            }
        }

    }

    FluPopup {
        id: popup
        parent: searchableCombox
        visible: false
        width: popupWidth > searchableCombox.width ? popupWidth : searchableCombox.width
        height: popupHeight
        modal: false
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

        x: searchBox.x
        // 根据屏幕绝对位置和可用空间自动计算y坐标
        y: {
            if(autoExpandDirection) {
                // 获取组件在屏幕上的绝对位置
                const globalPos = searchBox.mapToGlobal(0, 0)
                const screenAvailableHeight = Screen.height // 获取屏幕绝对高度
                // 计算下方可用空间
                const availableSpaceBelow = screenAvailableHeight - (globalPos.y + searchBox.height)
                // 计算上方可用空间
                const availableSpaceAbove = globalPos.y
                if (availableSpaceBelow >= height) {
                    // 下方空间足够，向下展开
                    return searchBox.y + searchBox.height
                } else if (availableSpaceAbove >= height) {
                    // 上方空间足够，向上展开
                    return searchBox.y - height
                } else {
                    // 两边都不够，选择空间更大的方向
                    if (availableSpaceBelow > availableSpaceAbove) {
                        return searchBox.y + searchBox.height
                    } else {
                        return searchBox.y - height
                    }
                }

            } else {
                // 不自动判断，根据expandUpward属性决定展开方向
                return expandUpward ? searchBox.y - height : searchBox.y + searchBox.height
            }
        }

        contentItem: ListView {
            id: listView
            model: filteredModel
            clip: true
            currentIndex: -1
            focus: true // 确保ListView可以获得焦点
            highlightFollowsCurrentItem: true
            keyNavigationEnabled: true

            // 下拉框回车选中事件处理
            Keys.onPressed: (event) => {
                if(event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                    // 回车键选中当前项
                    if(currentIndex >=0) {
                        const item = filteredModel.get(currentIndex)
                        if(item) {
                            // 获取选中选项的值
                            setSelectedVal(item)
                            searchBox.forceActiveFocus()
                            popup.close()
                        }
                    }
                    event.accepted = true
                }
            }

            delegate: FluItemDelegate {
                width: listView.width
                text: getComboText(model)
                highlighted: ListView.isCurrentItem || mouseAreaListViewId.containsMouse
                hoverEnabled: true
                font: FluTextStyle.Body

                MouseArea {
                    id: mouseAreaListViewId
                    anchors.fill: parent
                    hoverEnabled: true
                    acceptedButtons: Qt.LeftButton

                    onEntered:  {
                        // 鼠标进入时高亮当前选项
                        listView.currentIndex = index
                    }

                    onClicked: {
                        setSelectedVal(model)
                        searchBox.forceActiveFocus()
                        popup.close()
                    }
                }
            }

            T.ScrollIndicator.vertical: ScrollIndicator { }
        }

        onVisibleChanged: {
            if(!visible) {
                const selText = getShowText(currentValue, currentText)
                if (selText !== searchBox.text) {
                    searchBox.text = selText
                }
            }
        }
    }

    onCurrentValueChanged: {
        if ("" === currentValue) {
            searchableCombox.currentText = ""
            searchableCombox.currentIndex = -1
            searchBox.text = ""
        } else {
            if (!searchBox.onClickSelect) {
                onChangeDeal(null, currentValue)
            }
        }
    }

    onCodeTableFilterValChanged: {
        // 代码表选项过滤规则变化重新加载字典数据填充下拉框
        getNameAndCode()
    }

    onModelNameChanged: {
        // 字典代码或代码表名变化重新加载字典数据填充下拉框
        getNameAndCode()
    }

    onJsonObjectChanged: {
        searchableCombox.jsonArrayToList(dataModel, jsonObject)
    }

    // 获取JsonArray字典项数组
    function getNameAndCode() {
        if ("" !== modelName) {
            try {
                if (1 === modelTableType) {
                    dicQuery()
                } else {
                    codeTableQuery()
                }
            } catch(ex) {
                console.warn("查询数据填充下拉框异常", modelName, ex.message);
            }
        }
    }

    // 将jsonArray 转化为 ListModel
    function jsonArrayToList(sourceModel, sourceArray) {
        if(sourceArray && Array.isArray(sourceArray)) {
            sourceDataModel = sourceArray   // 数据源存下来用于翻译启用标识为0(禁用)的选项
            sourceModel.clear()
            if ("" !== codeTableFilterVal) {
                // 过滤不符合要求的数据
                const filterParams = codeTableFilterVal.split(",")
                var filterName = filterParams[0]
                var filterValue = filterParams[1]
                if (filterParams.length > 2) {
                    var subIndexStart = filterParams[2]
                    var subIndexEnd = filterParams[3]
                }
            }
            if (searchableCombox.needEmptyOption) {
                // 需要空选项的情况，填充空选项
                const emptyOption = {}
                emptyOption[textRole] = ""
                emptyOption[valueRole] = ""
                sourceModel.append(emptyOption)
            }
            if (null !== searchableCombox.itemObject) {
                sourceModel.append(searchableCombox.itemObject)
            }

            for(var i = 0; i < sourceArray.length; i++) {
                const sourceItem = sourceArray[i]
                if(sourceItem && typeof sourceItem === "object") {
                    if ("" !== searchableCombox.currentValue
                            && sourceItem[valueRole] === searchableCombox.currentValue) {
                        // 组件默认给currentValue赋了初始值时，初始化组件展示结果
                        searchBox.onClickSelect = true
                        onChangeDeal(sourceItem, "")
                    }
                    if ("" !== codeTableFilterVal &&
                            ((typeof subIndexStart === "undefined" && !filterValue.includes(sourceItem[filterName]))
                             || (typeof subIndexStart !== "undefined"
                                 && !filterValue.includes(sourceItem[filterName].substring(subIndexStart, subIndexEnd)))
                            )
                        ) {
                        // 代码表根据FilterVal过滤不匹配项
                        continue;
                    }
                    if ("" !== notShowCodes && notShowCodes.includes("," + sourceItem[valueRole] + ",")) {
                        // 过滤不希望显示的选项
                        continue;
                    }
                    if ((typeof sourceItem.enableFlag !== 'undefined' && "0" !== sourceItem.enableFlag)
                            || typeof sourceItem.enableFlag === 'undefined') {
                        // 只加载启用标识不为0（禁用）的选项
                        sourceModel.append(sourceItem)
                    }
                }
            }
        }
    }

    // 字典表查询
    function dicQuery() {
        var params = {}
        params.key = modelName
        params.flagType = modelName
        params.orderByColumn = "" !== orderByColumn ? orderByColumn : "orderNum"
        // commonController.lookupFlagDataQml(params, function(result){
        //     if(ServerApiUtil.isOk(result)) {
        //         searchableCombox.jsonArrayToList(dataModel, result.data)
        //     } else {
        //         console.warn("下拉框从数据库加载数据失败", modelName);
        //     }
        // })
    }

    // 代码表查询
    function codeTableQuery() {
        const params = {}
        params.urlMethod = "/sys/commonData/list";
        params.businessParams = {};
        const tableNameList = []
        const codeTableParams = {}
        codeTableParams.tableName = modelName
        if("" !== orderByColumn) {
            codeTableParams.orderByColumn = orderByColumn
            codeTableParams.isAsc = orderBy
        }
        tableNameList.push(codeTableParams)
        params.businessParams.tableNameList = tableNameList
        // commonController.inspectionPostBusinessParamsQml(params, function(result){
        //     if (ServerApiUtil.isOk(result) && null !== result.data) {
        //         const tableObjs = Object.values(result.data)
        //         if (tableObjs.length > 0) {
        //             const tableObj = tableObjs[0]
        //             searchableCombox.jsonArrayToList(dataModel, tableObj.data)
        //         }
        //     } else {
        //         console.warn("查询代码表异常", modelName);
        //     }
        // });
    }

    // 初始化下拉框展示全部选项内容
    function filteredModelAppend() {
        filteredModel.clear()
        for(let i = 0; i < dataModel.count; i++) {
            let item = dataModel.get(i)
            filteredModel.append(item)
        }
    }

    // 构造下拉框选项内容展示样式
    function getComboText(item) {
        if(null === item || typeof item === 'undefined') {
            return ""
        }
        return getShowText(item[valueRole], item[textRole])
    }

    // 选中选项后赋值
    function setSelectedVal(item){
        searchBox.onClickSelect = true
        onChangeDeal(item, "")
    }

    function onChangeDeal(item, inputVal){
        if (null === item) {
            item = getCurItemObj("", inputVal)
        }
        const curVal = (null !== item && item[valueRole] !== undefined) ? item[valueRole] : ""
        const curText = (null !== item && item[textRole] !== undefined) ? item[textRole] : ""
        searchableCombox.currentText = curText
        searchableCombox.currentIndex = getOriginalIndex(curText, curVal)
        if("" === inputVal) {
            searchableCombox.currentValue = curVal
            searchBox.onClickSelect = false
        }
        searchableCombox.selectedOptionObj(item)
        searchBox.text = getShowText(curVal, curText)
    }

    function getShowText(curVal, curText) {
        if(1 === searchableCombox.comboTextType) {
            return curText
        }else if(2 === searchableCombox.comboTextType) {
            if ("" === curVal && "" === curText) {
                return ""
            } else if ("" === curVal && "" !== curText) {
                return curText
            } else {
                return curVal + "-" + curText
            }
        }else {
            return curVal
        }
    }

    // 获取原始模型中的索引
    function getOriginalIndex(text, value){
        if(dataModel.count > 0 && "" !== value) {
            for(let i = 0; i < dataModel.count; i++) {
                const item = dataModel.get(i)
                if(item && item[textRole] === text && item[valueRole] === value){
                    return i
                }
            }
        }
        return -1
    }

    // 通过vlaue获取匹配选项
    function getCurItemObj(text, value) {
        if(sourceDataModel.length > 0) {
            for(const item of sourceDataModel) {
                if(("" !== text && item[textRole] === text) || ("" !== value && item[valueRole] === value)){
                    return item
                }
            }
        }
        return null
    }
}
