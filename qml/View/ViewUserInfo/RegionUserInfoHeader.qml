// BaseLayout/qml/View/ViewUserInfo/RegionUserInfoHeader.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../../BizComponent"

ColumnLayout {
    id: root

    // 【规范执行】父级是 headerContainer (Item) -> 使用 anchors
    anchors.fill: parent

    spacing: 10

    // 【规范执行】父级是 RowLayout (root) -> 使用 Layout
    BizTextInput {
        formId: "userForm"
        key: "docNum"
        label: "证件号"

        labelRatio: 8
        inputRatio: 1

        // 2. 设置最小宽度保护
        // 因为 100 (期望) > 50 (底线)，比例 8:1 依然生效
        // 当总宽度极小，导致分给 input 的宽度 < 50 时，input 锁定为 50，不再缩小。
        minInputWidth: 100

        Layout.fillWidth: true
        Layout.fillHeight: true
    }

    // 示例：添加更多控件
    BizTextInput {
        formId: "userForm"
        key: "name"
        label: "姓名"
        labelRatio: 1
        inputRatio: 3
        tailRatio: 1
        Layout.fillWidth: true
        Layout.fillHeight: true
    }
}
