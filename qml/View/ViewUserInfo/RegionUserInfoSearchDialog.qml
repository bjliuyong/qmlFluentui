import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI
import "../../BizBaseComponent/BaseComp"
import "../../BizComponent"

BizBaseDialogItem {
    id: dialogRoot

    dialogTitle: "用户信息查询"
    positiveText: "查询"
    negativeText: "取消"

    contentDelegate: Component {
        // 使用 Layout 包裹表单
        ColumnLayout {
            // 【★★★★★ 必须设置 ★★★★★】
            // 这是整个弹窗宽度的来源！如果不写，就是 0 宽（白板）！
            implicitWidth: 400

            spacing: 15
            // 这里的 margin 控制表单距离弹窗边框的距离
            Layout.margins: 20

            property var scopeFormId: "searchForm"

            BizTextInput {
                key: "idNum"
                label: "身份证号"
                Layout.fillWidth: true
            }

            BizTextInput {
                key: "versionNum"
                label: "版本号"
                Layout.fillWidth: true
            }

            BizTextInput {
                key: "policeId"
                label: "警号"
                Layout.fillWidth: true
            }

            BizTextInput {
                key: "personName"
                label: "姓名"
                Layout.fillWidth: true
            }
        }
    }

    onConfirmed: (data) => {
        console.log("查询数据:", JSON.stringify(data))
    }
}
