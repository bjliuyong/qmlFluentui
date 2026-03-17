import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI
import "../../BizBaseComponent/BaseComp"
import "../../BizComponent"
import "../../LayoutTemplate/TopBottomSplit"

BizBaseDialogItem {
    property var allData: []
    property int allCheckState: Qt.Unchecked
    //property var bindRoleTableView: comTab.item.bindRoleTableView
    property var userInfo
    signal checkBoxChanged

    id: root
    title: ""

    positiveText: "确认"
    negativeText: "取消"

    onCheckBoxChanged: {
        updateAllCheck()
    }

    function bindUserRole(param) {
        if (!param || param === undefined) {
            showInfo("请选择用户")
            return
        }

        if (!param.idNum || param.idNum === undefined) {
            showInfo("请选择用户")
            return
        }

        var businessParam = {}
        var roles = []

        for (var i = 0; i < bindRoleTableView.rows; i++) {
            var item = bindRoleTableView.getRow(i)
            if (!item.checkbox.options.checked) {
                var role
                role = item.roleCode
                roles.push(role)
            }
        }
        if(roles.length === 0){
            showInfo("请选择要绑定的角色")
            return
        }

        businessParam["idNum"] = param.idNum
        businessParam["roles"] = roles
        businessParam["operateCode"] = "0"

        try {
            var params = {}
            params.urlMethod = "/sys/user/role/bind"

            if (typeof commonController !== 'undefined'
                    && commonController !== null) {
                commonController.inspectionPostBusinessParamsQml(
                            params, function (result) {

                                if (result.message !== "") {
                                    showError(result.message)
                                }
                            })
            } else {
                console.log("ERROR: commonController is not defined!")
            }
        } catch (ex) {
            console.log("Exception in menu loading:", ex.message)
            console.log("Stack:", ex.stack)
        }
    }

    Component{
        id:com_column_checbox
        Item{
            RowLayout{
                anchors.centerIn: parent
                FluText{
                    text: qsTr("")
                    Layout.alignment: Qt.AlignVCenter
                }
                FluCheckBox {
                    Layout.alignment: Qt.AlignVCenter
                    checkState: root.allCheckState
                    animationEnabled: false
                    clickListener: function () {
                        root.allCheckState = checkState
                        for (let i = 0; i < bindRoleTableView.rows; i++) {
                            const rowData = bindRoleTableView.getRow(i)
                            rowData.checkbox = bindRoleTableView.customItem(com_checbox, {"checked": checkState === Qt.Checked})
                            bindRoleTableView.setRow(i, rowData)
                        }
                    }
                }
            }
        }
    }
    Component{
        id:com_checbox
        Item{
            FluCheckBox{
                anchors.centerIn: parent
                checked: true === options.checked
                animationEnabled: false
                clickListener: function(){
                    var obj = bindRoleTableView.getRow(row)
                    obj.checkbox = bindRoleTableView.customItem(com_checbox,{checked})
                    bindRoleTableView.setRow(row,obj)
                    root.checkBoxChanged()
                }
            }
        }
    }


    function updateAllCheck() {
        let checkedCount = 0
        for (var i = 0; i < bindRoleTableView.rows; i++) {
            if (bindRoleTableView.getRow(i).checkbox.options.checked) {
                checkedCount += 1
            }
        }
        if (checkedCount > 0 && checkedCount === bindRoleTableView.rows) {
            root.allCheckState = Qt.Checked
        } else if (checkedCount > 0 && checkedCount < bindRoleTableView.rows) {
            root.allCheckState = Qt.PartiallyChecked
        } else {
            root.allCheckState = Qt.Unchecked
        }
    }

    function queryUserList() {
        allData = []

        var pageNum = 1
        var pageSize = 1000

        try {
            var params = {}
            params.urlMethod = "/sys/role/list"
            params.businessParams = {}

            params.businessParams.pageNum = pageNum
            params.businessParams.pageSize = pageSize

            if (typeof commonController !== 'undefined'
                    && commonController !== null) {
                commonController.inspectionPostBusinessParamsQml(
                            params, function (result) {

                                // 解析并处理data部分
                                if (result && result.data !== undefined
                                        && result.data.rows !== undefined
                                        && Array.isArray(result.data.rows)) {
                                    var rows = (result && result.data
                                                && result.data.rows) ? result.data.rows : []
                                    for (var i = 0; i < rows.length; i++) {
                                        if (!rows[i]
                                                || typeof rows[i] !== "object") {
                                            rows[i] = {}
                                        }
                                        console.log("================================================== checkBoxStatus    " + "i = " + i)
                                        console.log(JSON.stringify(rows[i]))

                                        rows[i].checkbox = bindRoleTableView.customItem(com_checbox,{checked:false})

                                    }
                                    root.allData = rows
                                    root.allCheckState = Qt.Unchecked
                                }
                            })
            } else {
                console.log("ERROR: commonController is not defined!")
            }
        } catch (ex) {
            console.log("Exception in menu loading:", ex.message)
            console.log("Stack:", ex.stack)
        }
    }

    Component.onCompleted: {
        queryUserList()
    }

    //contentDelegate: Component {
    FluFrame {
        //Component {
        id: comTab

        // 使用 Item 作为容器来处理边距 (Padding)
        Item {
            // 设置一个合适的固定宽度，或者根据父级计算
            implicitWidth: 400
            // 高度由内部内容撑开，并加上上下边距
            implicitHeight: 400

            ColumnLayout {

                //property alias bindRoleTableView: bindRoleTableView
                anchors.centerIn: parent
                anchors.fill: parent
                spacing: 5

                Row {
                    width: parent.width
                    height: 30

                    Rectangle {
                        anchors.fill: parent
                        color: FluTheme.dark ? Qt.rgba(43/255,43/255,43/255,1) : Qt.rgba(1,1,1,1)
                        // 左侧标题
                        Text {
                            id : titleId
                            text: "用户绑定角色"
                            anchors.left: parent.left
                            anchors.leftMargin: 15
                            anchors.verticalCenter: parent.verticalCenter
                            color: FluTheme.dark ? "white" : Qt.rgba(43/255,43/255,43/255,1)
                            font.pixelSize: 14
                            font.bold: true
                        }
                    }

                    MouseArea {
                        id: titleBarMouseArea
                        anchors.fill: parent
                        property int startPosX: 0
                        property int startPosY: 0
                        onPressed: function (mouse) {
                            startPosX = mouse.x
                            startPosY = mouse.y
                        }
                        onPositionChanged: function (mouse) {
                            if (pressed) {
                                let deltaX = mouse.x - startPosX
                                let deltaY = mouse.y - startPosY
                                root.x = root.x + deltaX
                                root.y = root.y + deltaY
                            }
                        }
                    }
                }

                // // 表格
                FluTableView {
                    id: bindRoleTableView
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    onRowsChanged: {
                        root.checkBoxChanged()
                    }
                    columnSource: [{
                            title: bindRoleTableView.customItem(com_column_checbox,{checked:false}),
                            "dataIndex": 'checkbox',
                            "frozen": true,
                            "width": (bindRoleTableView.width) * 1 / 8
                        }, {
                            "title": "角色代码",
                            "dataIndex": "roleCode",
                            "width": (bindRoleTableView.width) * 3 / 8
                        }, {
                            "title": "角色名称",
                            "dataIndex": "roleName",
                            "width": (bindRoleTableView.width) * 4 / 8
                        }]

                    dataSource: allData
                    onCurrentChanged: {

                    }
                }

                RowLayout {
                    id: functionItem
                    spacing: 10
                    anchors.horizontalCenter: parent.horizontalCenter

                    FluFilledButton {
                        text: "保存"
                        Layout.preferredWidth: 100
                        onClicked: {
                            var userInfo = root.userInfo
                            if (userInfo === "") {
                                showInfo("请选择用户")
                                return
                            }

                            var businessParam = {}
                            var roles = []
                            for (var i = 0; i < bindRoleTableView.rows; i++) {
                                var item = bindRoleTableView.getRow(i)
                                if (item.checkbox.options.checked) {
                                    var role
                                    role = item.roleCode
                                    roles.push(role)
                                }
                            }

                            if(roles.length === 0){
                                showInfo("请选择要绑定的角色")
                                return
                            }

                            businessParam["idNum"] = userInfo
                            businessParam["roles"] = roles
                            businessParam["operateCode"] = "0"

                            try {
                                var params = {}
                                params.urlMethod = "/sys/user/role/bind"
                                params.businessParams = businessParam

                                console.log(JSON.stringify(params))

                                if (typeof commonController !== 'undefined'
                                        && commonController !== null) {
                                    commonController.inspectionPostBusinessParamsQml(
                                                params, function (result) {

                                                    if (result.message !== "") {
                                                        showError(result.message)
                                                        return
                                                    }

                                                    //showInfo("绑定成功")

                                                    confirmed()
                                                    close()
                                                })
                                } else {
                                    console.log("ERROR: commonController is not defined!")
                                }
                            } catch (ex) {
                                console.log("Exception in menu loading:",
                                            ex.message)
                                console.log("Stack:", ex.stack)
                            }
                        }
                    }

                    FluFilledButton {
                        text: "取消"
                        Layout.preferredWidth: 100
                        onClicked: close()
                    }
                }
            }
        }
    }
}
