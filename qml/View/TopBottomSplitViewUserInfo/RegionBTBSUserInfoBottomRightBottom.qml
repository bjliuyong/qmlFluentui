import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../../BizComponent"
import "../../LayoutTemplate/TopBottomSplit"
import "../../BizBaseComponent/DataManager"

import "../../BizBaseComponent/BaseComp"
BizBaseTabItem {
    id: root
    // enabled: rootContent.editStatus
    property string editModel: "edit"
    property string versionNum
    // property var roleTableView: tableId.item.roleTableView
    anchors.fill: parent
    signal checkBoxChanged
    // title: "用户信息详情"
    onCheckBoxChanged: {
        updateAllCheck()
    }
    property var outUpdateCombox : splitView.updateCombox

    function updateAllCheck() {
        let checkedCount = 0
        for (var i = 0; i < roleTableView.rows; i++) {
            if (roleTableView.getRow(i).checkbox.options.checked) {
                checkedCount += 1
            }
        }
        if (checkedCount > 0 && checkedCount === roleTableView.rows) {
            root.allCheckState = Qt.Checked
        } else if (checkedCount > 0 && checkedCount < roleTableView.rows) {
            root.allCheckState = Qt.PartiallyChecked
        } else {
            root.allCheckState = Qt.Unchecked
        }
    }

    function resetPasswd()
    {
        try {
    var params=getCommitData("userInfo", "edit")
            var commitInfo = "密码重置成功"
        params.businessParams["updateList"][0]["password"]="123456"
        params.urlMethod = "/sys/user/save"
        console.log("===================================",
                    JSON.stringify(params))
        // commonController.inspectionPostBusinessParamsQml(params,
        //                                                  function (result) {
        //                                                      console.log("===================================",
        //                                                                  JSON.stringify(result))
        //                                                      if (result.message !== undefined
        //                                                              && result.message !== "") {
        //                                                          showInfo(result.message)
        //                                                      } else {
        //                                                          showInfo(commitInfo)
        //                                                      }
        //                                                      //bottomRightTopContent.queryUserList()
        //                                                  })
        } catch (ex) {
            console.log(ex.message)
        }
    }

    function commitData() {

        try {
            var params = getCommitData("userInfo", editModel)
            ;
            var commitInfo = "用户信息修改成功"

            params.urlMethod = "/sys/user/save"

            if (editModel == "add") {
                commitInfo = "用户信息新增成功"
            }
            console.log("===================================",
                        JSON.stringify(params))
            commonController.inspectionPostBusinessParamsQml(params,
                                                             function (result) {
                                                                 console.log("===================================",
                                                                             JSON.stringify(result))
                                                                 if (result.message !== undefined
                                                                         && result.message !== "") {
                                                                     showInfo(result.message)
                                                                 } else {
                                                                     showInfo(commitInfo)
                                                                 }
                                                                 bottomRightTopContent.queryUserList()
                                                             })
        } catch (ex) {
            console.log(ex.message)
        }
    }

    function unbindUserRole()
    {
        var userInfo = getFormData("userInfo")
        if (!userInfo || userInfo === undefined) {
            showInfo("请选择用户")
            return
        }

        if (!userInfo.idNum || userInfo.idNum === undefined) {
            showInfo("请选择用户")
            return
        }

        var businessParam = {}
        var roles = []
        for (var i = 0; i < roleTableView.rows; i++) {
            var item = roleTableView.getRow(i)
            if (item.checkbox.options.checked) {
                var role
                role = item.roleCode
                roles.push(role)
            }
        }

        if (roles.length === 0) {
            showInfo("请选择要解绑的角色")
            return
        }

        businessParam["idNum"] = userInfo.idNum
        businessParam["roles"] = roles
        businessParam["operateCode"] = "1"

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

                                //showInfo("解绑成功")
                                updateUserBindRoleInfo()
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

    function updateUserBindRoleInfo() {
        splitView.allData = []
        var userInfo = getFormData("userInfo")
        if (!userInfo || userInfo === undefined) {
            console.log("1")
            return
        }

        if (!userInfo.idNum || userInfo.idNum === undefined) {
             console.log("1")
            return
        }

        try {
            // 获取JsonArray字典项数组
            var params = {}
            params.urlMethod = "/sys/user/detail"
            params.businessParams = {}
            params.businessParams.idNum = userInfo.idNum

            commonController.inspectionPostBusinessParamsQml(params, function(result) {
                console.log(JSON.stringify(result))
                var rows = (result && result.data && result.data.roles) ? result.data.roles : []
                for (var i = 0; i < rows.length; i++) {
                    if (!rows[i] || typeof rows[i] !== "object") rows[i] = {}
                    rows[i].checkbox = roleTableView.customItem(com_checbox,{checked:false})
                }
                root.allData = rows
                root.allCheckState = Qt.Unchecked
            })
        } catch (ex) {
            console.log("Exception in menu loading:", ex.message)
            console.log("Stack:", ex.stack)
        }
    }


    contentDelegate:RowLayout {
        id: splitView
        anchors.fill: root

        //orientation: Qt.Horizontal
        FluGroupBox {
            id: leftContainer
            title: "用户信息"
            // color: "red"
            Layout.fillWidth: true
            Layout.preferredWidth: 7
            Layout.fillHeight: true
            spacing: 0
            Layout.margins: 0
            RowLayout {
                anchors.fill: parent

                spacing: 10
                Loader {
                    id : setComboBox
                    Layout.fillWidth: true
                    Layout.preferredWidth: 50
                    Layout.fillHeight: true
                    sourceComponent: basicInfoPart
                }
                Loader {
                    Layout.fillWidth: true
                    Layout.preferredWidth: 10
                    Layout.fillHeight: true
                    sourceComponent: imagePart
                }
            }
        }

        FluGroupBox {
            id: rightContainer
            title: "所含角色信息"
            Layout.fillWidth: true
            Layout.preferredWidth: 3
            Layout.fillHeight: true

            spacing: 0
            Layout.margins: 0
            RowLayout{
                anchors.fill: parent
                spacing: 10
                Loader {
                    id: tableId
                    Layout.fillWidth: true
                    Layout.preferredWidth: 100
                    Layout.fillHeight: true
                    sourceComponent: rolePart
                }
            }
        }


    Component {
        id: imagePart
        Rectangle {
            width: parent.width-30
            color: FluColors.Grey50

            Column {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 15

                // 上部分
                Rectangle {
                    width: parent.width
                    height: parent.height * 0.75
                    color: "transparent"

                    Image {
                        anchors.fill: parent
                        source: "qrc:/testImage/yawen.jpg"
                        fillMode: Image.PreserveAspectFit
                    }
                }

                // 下部分
                Row {
                    width: parent.width
                    height: parent.height * 0.2
                    spacing: 30

                    // 左手
                    Column {
                        width: parent.width / 2 - 15
                        height: parent.height
                        spacing: 8

                        Rectangle {
                            width: parent.width
                            height: parent.height - 30
                            color: FluColors.Grey30
                            radius: 8

                            Image {
                                anchors.centerIn: parent
                                width: Math.min(parent.width, parent.height) * 0.7
                                height: width
                                source: "qrc:/testImage/left.png"
                                fillMode: Image.PreserveAspectFit
                            }
                        }

                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "左手"
                            font.pixelSize: 12
                            color: FluColors.Grey120
                        }
                    }

                    // 右手
                    Column {
                        width: parent.width / 2 - 15
                        height: parent.height
                        spacing: 8

                        Rectangle {
                            width: parent.width
                            height: parent.height - 30
                            color: FluColors.Grey30
                            radius: 8

                            Image {
                                anchors.centerIn: parent
                                width: Math.min(parent.width, parent.height) * 0.7
                                height: width
                                source: "qrc:/testImage/right.png"
                                fillMode: Image.PreserveAspectFit
                            }
                        }

                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "右手"
                            font.pixelSize: 12
                            color: FluColors.Grey120
                        }
                    }
                }
            }
        }
    }

    property alias updateCombox: setComboBox.item
    Component {
        id: basicInfoPart
        GridLayout {
            columns: 4
            rowSpacing: 10
            columnSpacing: 20
            property alias customFilter: deptCode.codeTableFilterVal
            property string scopeFormId: "userInfo"

            BizTextInput {
                id: policeId
                key: "policeId"
                label: "警    号"
                Layout.columnSpan: 2
                Layout.fillWidth: true
            }
            BizTextInput {
                id: personName
                key: "personName"
                label: "姓    名"
                Layout.columnSpan: 2
                Layout.fillWidth: true
            }
            BizSearchableCombox {
                id: deptCode
                key: "deptCode"
                label: "所属部门"
                modelName: "biis_sys_dept_code"
                textRole   : "deptName"
                valueRole  : "deptCode"
                modelTableType: 2
                Layout.columnSpan: 2
                Layout.fillWidth: true
            }
            BizTextInput {
                id: orderNum
                key: "orderNum"
                label: "排 序 号"
                Layout.columnSpan: 2
                Layout.fillWidth: true
            }

            BizTextInput {
                id: idNum
                key: "idNum"
                label: "身份证号"
                Layout.fillWidth: true
                Layout.columnSpan: 2
            }

            BizRadioGroup {
                id: enableFlag
                key: "enableFlag"
                label: "启用标志"
                modelName: "enable_flag"
                textRole: "flagValue"
                valueRole: "flagCode"

                currentIndex: 0
                Layout.columnSpan: 2
                Layout.fillWidth: true
            }

            BizSearchableCombox {
                key: "userTypeCode"
                label: "用户类型"
                Layout.columnSpan: 2
                modelName: "biis_sys_user_type_code"
                textRole   : "userTypeName"
                valueRole  : "userTypeCode"
                modelTableType: 2
                Layout.fillWidth: true
                expandUpward: true
                autoExpandDirection : false
            }

            BizRadioGroup {
                key: "singleDeviceLoginFlag"
                label: "同时登录"
                modelName: "single_device_login_flag"
                textRole: "flagValue"
                valueRole: "flagCode"

                currentIndex: 0
                Layout.columnSpan: 2
                Layout.fillWidth: true
            }

            BaseData {
                key: "versionNum"

            }

            FluFilledButton {
                Layout.fillWidth: true
                text: "添加角色"
                onClicked: {
                    dialogContent["userBindRoleForm"].open()
                    var userIdNum = getFormData("userInfo").idNum
                    if (!userIdNum|| userIdNum === undefined) {
                        showInfo("请选择用户")
                        return
                    }
                    dialogContent["userBindRoleForm"].userInfo = getFormData("userInfo").idNum
                }
            }
            FluFilledButton {
                Layout.fillWidth: true
                text: "删除角色"
                onClicked: {
                     unbindUserRole()
                }
            }
            FluFilledButton {
                Layout.fillWidth: true
                text: "生物信息"
                onClicked: {
                    dialogContent["bioForm"].open()
                }
            }
            FluFilledButton {
                Layout.fillWidth: true
                text: "初始化密码"
                onClicked: {
                    resetPasswd()
                }
            }

            Item {
                Layout.fillHeight: true
                Layout.columnSpan: 4
                Layout.fillWidth: true
            }
            function getComBobox() {
                return deptCode
            }
        }
    }

    property int allCheckState: Qt.Unchecked
    // 模拟数据
    property var allData: []

    Component.onCompleted: {

        // 获取JsonArray字典项数组
        var params = {}
        params.urlMethod = "/sys/role/list"
        params.businessParams = {}

        commonController.inspectionPostBusinessParamsQml(params,
                                                         function (result) {
                                                             var rows = (result
                                                                         && result.data
                                                                         && result.data.rows) ? result.data.rows : []
                                                             for (var i = 0; i < rows.length; i++) {
                                                                 if (!rows[i]
                                                                         || typeof rows[i]
                                                                         !== "object") {
                                                                     rows[i] = {}
                                                                 }
                                                                 console.log("================================================== checkBoxStatus    " + "i = " + i)
                                                                 console.log(JSON.stringify(
                                                                                 rows[i]))

                                                                 rows[i].checkbox = roleTableView.customItem(com_checbox,{checked:false})
                                                             }
                                                             root.allData = rows
                                                             root.allCheckState = Qt.Unchecked
                                                         })
    }

    function getSelectRow() {
        var selectArray = []
        for (var i = 0; i < roleTableView.rows; i++) {
            var obj = roleTableView.getRow(i)
            if (!obj)
                continue
            selectArray.push(obj.checkbox.options.checked)
        }
        return selectArray
    }
    function clearSelectRow() {
        for (var i = 0; i < roleTableView.rows; i++) {
            var obj = roleTableView.getRow(i)
            if (!obj)
                continue
            obj.checkbox.options.checked = false
        }
    }

    Component{
        id:com_column_checkbox
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
                        for (let i = 0; i < roleTableView.rows; i++) {
                            const rowData = roleTableView.getRow(i)
                            rowData.checkbox = roleTableView.customItem(com_checbox, {"checked": checkState === Qt.Checked})
                            roleTableView.setRow(i, rowData)
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
                    var obj = roleTableView.getRow(row)
                    obj.checkbox = roleTableView.customItem(com_checbox,{checked})
                    roleTableView.setRow(row,obj)
                    root.checkBoxChanged()
                }
            }
        }
    }

    Component {
        id: rolePart
        ColumnLayout {
            property alias roleTableView: roleTableView
            anchors.fill: parent
            Layout.fillWidth: true

            FluTableView {
                id: roleTableView
                Layout.fillHeight: true
                Layout.fillWidth: true

                columnSource: [{
                        title: roleTableView.customItem(com_column_checkbox,{checked:false}),
                        "dataIndex": "checkbox",
                        "width": (roleTableView.width - 40) / 3
                    }, {
                        "title": "角色代码",
                        "dataIndex": "roleCode",
                        "width": (roleTableView.width - 40) / 3
                    }, {
                        "title": "角色名称",
                        "dataIndex": "roleName",
                        "width": (roleTableView.width - 40) / 3
                    }]
                dataSource: root.allData
                Component.onCompleted: {

                }
            }
        }
    }
}
}
