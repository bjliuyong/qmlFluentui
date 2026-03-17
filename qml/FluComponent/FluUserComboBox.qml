import QtQuick
import QtQuick.Controls

import FluentUI
import QtQuick.Templates as T

/**
 * @file FluUserComboBox.qml
 * @brief 自定义用户下拉框组件：
 *        1、组件自动查询系统用户表获取用户的警号、身份证号、姓名加载到下拉框提供选择，对所属部门代码属性“deptCode”赋值查询指定部门的用户信息；
 *           通过鼠标或键盘上下按钮选择选项
 *        2、组件提供模糊查询功能，在输入框输入信息，组件会对警号、身份证号、姓名过滤出符合条件的选项提供选择；
             当出现唯一匹配选项时，自动选中选项并关闭下拉框
 *        3、通过“showUserID、showIDNum、showName”三个属性控制下拉框是否展示警号、身份证号和姓名，true展示，false不展示;
 *           鼠标放置到输入框内，会悬浮框显示警号、身份证号和姓名三项完整信息方便查看
 *        4、通过“autoExpandDirection”属性关闭自适应后，可通过“expandUpward”属性决定下拉框向上还是向下展开
 *        5、通过popupHeight、popupWidth 属性控制下拉框列表区域高度和宽度
 * @author dengyurong
 * @date 2026-02-02
 */

Item {
    id : userCombox
    width: 100
    height: 28
    enabled: !disabled
    property var jsonObject
    // 选中选项的文本和代码
    property string curUserID: ""
    property string curIDNum: ""
    property string curName: ""
    property int currentIndex: -1
    property bool showUserID: true  // 是否显示警号
    property bool showIDNum: true   // 是否显示身份证号
    property bool showName: true    // 是否显示姓名
    // 所属部门代码，用于过滤用户信息
    property string deptCode: ""
    // 下拉框内容查询途径 1redis查询，2后端接口直接查数据库
    property int dataQueryWay: 2

    property bool expandUpward: false   // 下拉框是否向上展开
    property bool autoExpandDirection: true   // 是否自动决定展开方向
    property bool needEmptyOption: false   // 是否需要空选项
    property bool initLoadData: true   // 是否组件初始化完成后加载用户数据
    property int popupHeight: 150   // 自定义下拉列表区域的高度
    property int popupWidth: 0      // 自定义下拉列表区域的宽度，值小于输入框宽度时默认使用输入框宽度
    property alias searchBox: searchBox

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

        // onFocusChanged: {
        onActiveFocusChanged: {
            if (activeFocus && !popup.visible) {
                filteredModelAppend()
                popup.open()
            } else if(!focus && popup.visible) {
                popup.close()
            }
        }
        onTextChanged: {
            if (activeFocus && text !== buildDisplayText(curIDNum, curName, curUserID)) {
                filteredModel.clear()
                if(text === "" || text === null) {
                    userCombox.curIDNum = ""
                    // 如果文本为空，显示所有选项
                    filteredModelAppend()
                    popup.open()
                } else {
                    // 过滤匹配的选项
                    const searchLower = text.toLowerCase()
                    for(let j = 0; j < dataModel.count; j++) {
                        const item = dataModel.get(j)
                        const userIDLower = item.userID.toLowerCase()
                        const idNumLower = item.idNum.toLowerCase()
                        const nameLower = item.name.toLowerCase()

                        const userIDMatch = userCombox.showUserID && userIDLower.includes(searchLower)
                        const idNumMatch = userCombox.showIDNum && idNumLower.includes(searchLower)
                        const nameMatch = userCombox.showName && nameLower.includes(searchLower)

                        if(userIDMatch || idNumMatch || nameMatch) {
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

        // 添加MouseArea来处理悬停事件
        MouseArea {
            anchors.fill: parent
            anchors.rightMargin: searchBox.rightPadding
            hoverEnabled: true
            propagateComposedEvents: true  // 开启事件传递，让鼠标事件透传给父组件TextField
            onPressed: {
                mouse.accepted = false  // 放行鼠标点击事件给父组件TextField使用
            }
            onEntered: {
                // 鼠标进入时显示提示
                tooltipTimer.start()
            }
            onExited: {
                // 鼠标离开时隐藏提示
                tooltipTimer.stop()
                if (tooltip.visible) {
                    tooltip.close()
                }
            }
        }

        // 提示定时器
        Timer {
            id: tooltipTimer
            interval:500 // 500毫秒后显示
            running: false
            repeat: false
            onTriggered: {
                if (searchBox.text && searchBox.text !== searchBox.placeholderText && !popup.visible) {
                    tooltip.open()
                }
            }
        }

        // 提示窗口
        Popup {
            id: tooltip
            width: Math.max(200, tooltipContent.implicitWidth + 20)
            height: tooltipContent.implicitHeight + 20
            modal: false
            focus: false
            closePolicy: Popup.NoAutoClose
            padding: 10
            background: Rectangle {
                radius: 5
                color: FluTheme.dark ? Qt.rgba(43/255,43/255,43/255,1) : Qt.rgba(1,1,1,1)
                border.color: FluTheme.dark ? Qt.rgba(26/255,26/255,26/255,1) : Qt.rgba(191/255,191/255,191/255,1)
                FluShadow{
                    radius: 5
                }
            }

            x: searchBox.x + 10
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
                        return searchBox.y + searchBox.height + 5
                    } else if (availableSpaceAbove >= height) {
                        // 上方空间足够，向上展开
                        return searchBox.y - height - 5
                    } else {
                        // 两边都不够，选择空间更大的方向
                        if (availableSpaceBelow > availableSpaceAbove) {
                            return searchBox.y + searchBox.height + 5
                        } else {
                            return searchBox.y - height - 5
                        }
                    }

                } else {
                    // 不自动判断，根据expandUpward属性决定展开方向
                    return expandUpward ? searchBox.y - height - 5 : searchBox.y + searchBox.height + 5
                }
            }

            contentItem: Text {
                id: tooltipContent
                text: ""
                font: FluTextStyle.Body
                wrapMode: Text.Wrap
                color: {
                    if(!userCombox.enabled) {
                        return FluTheme.dark ? Qt.rgba(131/255,131/255,131/255,1) : Qt.rgba(160/255,160/255,160/255,1)
                    }
                    return FluTheme.dark ?  Qt.rgba(255/255,255/255,255/255,1) : Qt.rgba(27/255,27/255,27/255,1)
                }
            }
        }
    }

    FluPopup {
        id: popup
        parent: userCombox
        visible: false
        width: popupWidth > userCombox.width ? popupWidth : userCombox.width
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
                text: buildDisplayText(model.idNum, model.name, model.userID)
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
                const selText = buildDisplayText(curIDNum, curName, curUserID)
                if (selText !== searchBox.text) {
                    searchBox.text = selText
                }
            }
        }
    }

    Component.onCompleted: {
        if (userCombox.initLoadData) {
            queryUserInfo()
        }
    }

    onCurIDNumChanged: {
        if ("" === curIDNum) {
            userCombox.curUserID = ""
            userCombox.curName = ""
            userCombox.currentIndex = -1
            searchBox.text = ""
            searchBox.placeholderText = "请选择"
        } else {
            if (!searchBox.onClickSelect) {
                idNumChangeDeal(null, curIDNum)
            }
        }
    }

    onDeptCodeChanged: {
        queryUserInfo()
    }

    onJsonObjectChanged: {
        userCombox.jsonArrayToList(dataModel, jsonObject)
    }

    // 将jsonArray 转化为 ListModel
    function jsonArrayToList(sourceModel, sourceArray) {
        if(sourceArray && Array.isArray(sourceArray)) {
            sourceDataModel = sourceArray   // 数据源存下来用于翻译启用标识为0(禁用)的选项
            sourceModel.clear()
            if (userCombox.needEmptyOption) {
                // 需要空选项的情况，填充空选项
                const emptyOption = {}
                emptyOption.userID = ""
                emptyOption.idNum = ""
                emptyOption.name = ""
                sourceModel.append(emptyOption)
            }
            for(var i = 0; i < sourceArray.length; i++) {
                const sourceItem = sourceArray[i]
                if(sourceItem && typeof sourceItem === "object") {
                    const modelObj = {}
                    modelObj.userID = sourceItem.policeId
                    modelObj.idNum = sourceItem.idNum
                    modelObj.name = sourceItem.personName
                    if ((typeof sourceItem.enableFlag !== 'undefined' && "0" !== sourceItem.enableFlag)
                            || (typeof sourceItem.enableFlag === 'undefined')) {
                        // 只加载启用标识不为0（禁用）的选项
                        sourceModel.append(modelObj)
                    }
                    if ("" !== userCombox.curIDNum && sourceItem.idNum === userCombox.curIDNum) {
                        // 组件默认给curIDNum赋了初始值时，初始化组件展示结果
                        searchBox.onClickSelect = true
                        idNumChangeDeal(modelObj, "")
                    }
                }
            }
        }
    }

    function queryUserInfo() {
        const params = {}
        if (1 === userCombox.dataQueryWay) {
            // TODO redis查询功能待完善
        } else {
            try {
                params.urlMethod = "/sys/user/list";
                params.businessParams = {};
                params.businessParams.pageNum = 1
                params.businessParams.pageSize = 1000
                if(userCombox.deptCode !== null && userCombox.deptCode !== ""){
                    params.businessParams.deptCode = userCombox.deptCode
                }
                // commonController.inspectionPostBusinessParamsQml(params, function(result){
                //     if (ServerApiUtil.isOk(result) && result.data.rows.length > 0) {
                //         dataModel.clear()
                //         userCombox.jsonArrayToList(dataModel, result.data.rows)
                //     } else {
                //         console.warn("查询用户信息列表异常");
                //     }
                // });
            } catch(ex) {
                console.warn("查询用户信息列表异常", ex.message);
            }
        }
    }

    // 初始化下拉框展示全部选项内容
    function filteredModelAppend() {
        filteredModel.clear()
        for(let i = 0; i < dataModel.count; i++) {
            let item = dataModel.get(i)
            filteredModel.append(item)
        }
    }

    // 构造显示文本
    function buildDisplayText(idNum, name, userID){
        if ("" === idNum || typeof idNum === 'undefined') {
            // 空选项直接返回空显示
            return ""
        }

        const parts = []
        if(userCombox.showName && name){
            parts.push("姓名：" + name)
        }
        if(userCombox.showUserID && userID){
            parts.push("警号：" + userID)
        }
        if(userCombox.showIDNum && idNum){
            parts.push("身份证：" + idNum)
        }
        return parts.join(" | ")
    }

    // 选中选项后赋值
    function setSelectedVal(item){
        searchBox.onClickSelect = true
        idNumChangeDeal(item, "")
    }

    function idNumChangeDeal(item, inputIdNum){
        if (null === item) {
            item = getCurItemObj(inputIdNum)
        }
        const userID = (null !== item && item.userID !== undefined) ? item.userID : ""
        const idNum = (null !== item && item.idNum !== undefined) ? item.idNum : ""
        const name = (null !== item && item.name !== undefined) ? item.name : ""
        const itemIndex = getOriginalIndex(userID, idNum)

        userCombox.curUserID = userID
        userCombox.curName = name
        userCombox.currentIndex = itemIndex !== undefined ? itemIndex : -1
        if ("" === inputIdNum) {
            userCombox.curIDNum = idNum
            searchBox.onClickSelect = false
        }
        searchBox.text = buildDisplayText(idNum, name, userID)
        setTooltipText()
    }

    // 获取原始模型中的索引
    function getOriginalIndex(userID, idNum){
        if(dataModel.count > 0) {
            for(let i = 0; i < dataModel.count; i++) {
                const item = dataModel.get(i)
                if(item && ((userID && item.userID === userID) || (idNum && item.idNum === idNum))){
                    return i
                }
            }
        }
        return -1
    }

    // 通过vlaue或text获取匹配选项
    function getCurItemObj(idNum) {
        if(sourceDataModel.length > 0) {
            for(const sourceItem of sourceDataModel) {
                if(sourceItem.idNum === idNum){
                    const modelObj = {}
                    modelObj.userID = sourceItem.policeId
                    modelObj.idNum = sourceItem.idNum
                    modelObj.name = sourceItem.personName
                    return modelObj
                }
            }
        }
        return null
    }

    // 设置提示框文本值
    function setTooltipText() {
        tooltipContent.text = "姓名：" + userCombox.curName + "\n" +
                              "警号：" + userCombox.curUserID + "\n" +
                              "身份证：" + userCombox.curIDNum
    }
}
