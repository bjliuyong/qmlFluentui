// BaseLayout/qml/View/ViewUserInfo/RegionUserInfoEditDialog.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI
import "../../BizBaseComponent/BaseComp"
import "../../BizComponent"
import "../../LayoutTemplate/HeaderBodyFooter"

BaseHeaderBodyFooterDialog {
    id: dialogRoot
    title: "用户信息查询"

    // 【修复报错】必须使用字符串。如果 "" 仍显示边框，通常是组件库自身的绘制特性
    positiveText: "确定"
    negativeText: "取消"

    contentDelegate: Component {
        // 使用 Item 作为容器来处理边距 (Padding)
        Item {
            // 设置一个合适的固定宽度，或者根据父级计算
            implicitWidth: 350
            // 高度由内部内容撑开，并加上上下边距
            implicitHeight: formColumn.implicitHeight + 40

            ColumnLayout {
                id: formColumn
                // 【关键】让内容填充容器，但保留 20 的边距
                anchors.fill: parent
                anchors.margins: 20

                spacing: 15 // 控件之间的垂直间距

                // 1. 身份证号
                BizTextInput {
                    id: id_num
                    formId: "biis_sys_user_code"
                    key: "id_num"
                    label: "身份证号"
                    Layout.fillWidth: true
                }

                // 2. 版本号
                BizTextInput {
                    id: version_num
                    formId: "biis_sys_user_code"
                    key: "version_num"
                    label: "版本号"
                    Layout.fillWidth: true
                }

                // 3. 警号
                BizTextInput {
                    formId: "biis_sys_user_code"
                    key: "police_id"
                    label: "警号"
                    Layout.fillWidth: true
                }

                // 4. 姓名
                BizTextInput {
                    formId: "biis_sys_user_code"
                    key: "person_name"
                    label: "姓名"
                    Layout.fillWidth: true
                }
            }
        }
    }
}
