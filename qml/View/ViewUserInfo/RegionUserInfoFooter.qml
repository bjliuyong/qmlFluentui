
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../../BizComponent"
import "../../BizBaseComponent/BaseComp"
import "../../LayoutTemplate/HeaderBodyFooter"

BizBaseTabItem {
    id: root
    enabled: editStatus


    /*****************************测试控件使用函数****************************/
    // controlId 控件ID testValue 待测试的value值
    function testFunction(controlId, testValue) {
        controlId.setValue(testValue)
        console.log("testresult ===========>" + controlId.getValue())
    }
    function reset(controlId) {
        controlId.reset()     //测试重置函数
    }

    contentDelegate:RowLayout {
        id: splitView
        width: root.width*2/3
        // anchors.right: root.right
        // anchors.top: root.top
        // anchors.bottom: root.bottom
        anchors.fill: parent
        // anchors.margins: 10
        //orientation: Qt.Horizontal


        FluGroupBox {
            id: leftContainer
            title:"用户信息"
            // color: "red"
            Layout.fillWidth: true
            Layout.preferredWidth: 6
            Layout.fillHeight: true
            spacing: 0
            Layout.margins: 0
            RowLayout{
                anchors.fill: parent

                spacing: 10
                Loader{
                    Layout.fillWidth: true
                    Layout.preferredWidth: 44
                    Layout.fillHeight: true
                    sourceComponent: basicInfoPart
                }
                Loader{
                    Layout.fillWidth: true
                    Layout.preferredWidth: 19
                    Layout.fillHeight: true
                    sourceComponent: imagePart
                }

            }

        }

        FluGroupBox {
            id: rightContainer
            title: "所含角色信息"
            color: "blue"
            Layout.fillWidth: true
            Layout.preferredWidth: 4
            Layout.fillHeight: true

        }




    Component{
        id: imagePart
        Rectangle{
            color:"red"
            ColumnLayout{
                anchors.fill: parent
                height: 100
                onHeightChanged: {

                }

                Rectangle{
                    color: "blue"
                    width: parent.width
                    Layout.fillWidth: true
                    Layout.margins: 10
                    height: 100
                    z:9
                }
            }
        }
    }

    Component{
        id: basicInfoPart
        GridLayout{
            columns:4
            rowSpacing: 10
            columnSpacing: 5
            property string scopeFormId: "userInfo"
            BizTextInput {
                id: idNum
                key: "idNum"
                label: "身份证号"

                Layout.fillWidth: true // 填满单元格
                Layout.columnSpan: 4
            }

            BizTextInput {
                id: policeId
                key: "policeId"
                label: "警    号"
                labelRatio: 2
                Layout.columnSpan: 2
                Layout.fillWidth: true
            }
            BizTextInput {
                id:personName
                key: "personName"
                label: "姓    名"
                labelRatio: 2
                Layout.columnSpan: 2
                Layout.fillWidth: true
            }
            BizTextInput {
                id: deptCode
                key: "deptCode"
                label: "所属部门"

                Layout.columnSpan: 4
                Layout.fillWidth: true
            }
            BizTextInput {
                id: orderNum
                key: "orderNum"
                label: "排 序 号"
                labelRatio: 2
                Layout.columnSpan: 2
                Layout.fillWidth: true
            }

            BizTextInput {
                id: password
                key: "password"
                label: "密    码"
                labelRatio: 2
                Layout.columnSpan: 2
                Layout.fillWidth: true
            }

            // BizFlagCombox {
            //     id: enableFlag
            //     key: "enableFlag"
            //     label: "启用标志"
            //     labelRatio: 2
            //     modelName: "enable_flag"
            //     // 案例，使用外部导入Json数组填充列表，Json结构
            //     textRole   : "flagValue"
            //     valueRole  : "flagCode"
            //     // jsonObject: {
            //     //     "array": [
            //     //         {flagName: "1008611", flagValue: "禁用"},
            //     //         {flagName: "1008610", flagValue: "启用"},
            //     //         {flagName: "1008619", flagValue: "部分禁用"},
            //     //     ]
            //     // };
            //     currentIndex: 0
            //     Layout.columnSpan: 2
            //     Layout.fillWidth: true
            //     onValueChanged: {
            //         console.log("============>" + getValue())
            //     }
            // }

            BizRadioGroup {
                id: enableFlag
                key: "enableFlag"
                label: "禁用标志"
                labelRatio: 2
                modelName: "enable_flag"
                textRole   : "flagValue"
                valueRole  : "flagCode"
                // jsonObject:  [
                //         {flagName: "1008611", flagValue: "禁用"},
                //         {flagName: "1008610", flagValue: "启用"},
                //         {flagName: "1008619", flagValue: "部分禁用"},
                //     ]

                Layout.columnSpan: 2
                Layout.fillWidth: true
            }

            BizTextInput {
                key: "userTypeCode"
                label: "用户类型"
                Layout.columnSpan: 2
                labelRatio: 2
                // modelName: "userTypeCode"
                Layout.fillWidth: true
            }


            BizTextInput {
                key: "singleDeviceLoginFlag"
                label: "同时登录"
                Layout.columnSpan: 2
                labelRatio: 2
                Layout.fillWidth: true
            }

            // 8. 用户类型
            BizTextInput {
                key: "user_type_code"
                label: "用户类型"
                Layout.columnSpan: 2
                labelRatio: 2
                Layout.fillWidth: true
            }
            FluFilledButton{
                Layout.fillWidth: true
                text: "显示详细信息"
            }
            FluFilledButton{
                Layout.fillWidth: true
                text: "特殊权限"
            }
            // FluFilledButton{
            //     Layout.fillWidth: true
            //     text: "添加角色"
            // }
            // FluFilledButton{
            //     Layout.fillWidth: true
            //     text: "删除角色"
            // }
            FluFilledButton{
                Layout.fillWidth: true
                text: "重置"
                onClicked: {
                    root.reset(enableFlag)
                }
            }
            FluFilledButton {
                Layout.fillWidth: true
                text : "测试数据"
                onClicked: {
                    root.testFunction(enableFlag,"2")
                }
            }

            Item{
                Layout.fillHeight: true
                Layout.columnSpan: 4
                property string key: "versionNum"
                Layout.fillWidth: true
            }


        }
        }
    }
}




