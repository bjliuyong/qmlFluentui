
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../../BizComponent"
import "../../LayoutTemplate/HeaderBodyFooter"

BaseHeaderBodyFooterItem {
    id: root
    enabled: rootContent.editStatus

    // 暴露给外部调用的函数保持不变
    function setDocNum(newDocNum) {
        console.log(newDocNum)
        id_num.setValue(newDocNum)
    }


    GridLayout {
        id: footerGrid
        anchors.fill: parent
        anchors.margins: 50 // 给整个网格一点边距
property string scopeFormId: "userInfo"
        // 【关键配置】设置为4列，行数会自动根据子元素数量计算
        columns: 4
        rowSpacing: 40
        columnSpacing: 50


        // 1. 身份证号
        BizTextInput {
            id: id_num
            key: "id_num"
            label: "身份证号"
            Layout.fillWidth: true // 填满单元格
        }

        // 2. 性别
        BizFlagCombox {
            id: version_num
            modelName: "genderCode"
            key: "genderCode"
            label: "性别"
            onValueChanged: {
                console.log("======================",value)
            }

            Layout.fillWidth: true

        }

        // 3. 警号//
        BizTextInput {

            key: "police_id"
            label: "警号"
            Layout.fillWidth: true
        }

        // 4. 姓名
        BizTextInput {
            //formId: "biis_sys_user_code"
            key: "person_name"
            label: "姓名"
            Layout.fillWidth: true
        }

        // ==================== 第二行 (4个) ====================

        // 5. 部门ID
        BizTextInput {
            key: "dept_id"
            label: "部门ID"
            Layout.fillWidth: true
        }

        // 6. 排序号
        BizTextInput {
            key: "order_num"
            label: "排序号"
            Layout.fillWidth: true
        }

        // 7. 考勤卡号
        BizTextInput {
            key: "attendance_num"
            label: "考勤卡号"
            Layout.fillWidth: true
        }


        // 8. 用户类型
        BizTextInput {
            key: "user_type_code"
            label: "用户类型"
            Layout.fillWidth: true
        }
        // 9. 【弹簧组件】填充最后剩余空间
        Item {
            // 如果你想让这个弹簧占满最后一行剩余的所有列（不仅仅是一格），可以解开下面的注释：
            // Layout.columnSpan: 1

            Layout.fillWidth: true
            Layout.fillHeight: true
        }
//}
    }
}
