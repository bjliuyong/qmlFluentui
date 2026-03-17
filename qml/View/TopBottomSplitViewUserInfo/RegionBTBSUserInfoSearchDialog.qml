// BaseLayout/qml/View/ViewUserInfo/RegionUserInfoEditDialog.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI
import "../../BizBaseComponent/BaseComp"
import "../../BizComponent"
import "../../LayoutTemplate/TopBottomSplit"

BizBaseDialogItem {
    id: dialogRoot
    title: "用户信息查询"

    positiveText: "查询"
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
                property var scopeFormId: "searchForm"
                spacing: 15 // 控件之间的垂直间距

                // 1. 身份证号
                BizTextInput {
                    id: idNum
                    key: "idNum"
                    label: "身份证号"
                    Layout.fillWidth: true
                    onValueChanged: {

                    }
                }

                // 2. 版本号
                BizTextInput {
                    id: versionNum
                    key: "versionNum"
                    label: "版本号"
                    Layout.fillWidth: true
                }

                // 3. 警号
                BizTextInput {
                    id: policeId
                    key: "policeId"
                    label: "警号"
                    Layout.fillWidth: true
                }

                // 4. 姓名
                BizTextInput {
                    id: personName
                    key: "personName"
                    label: "姓名"
                    Layout.fillWidth: true
                }
            }
        }
    }
}
