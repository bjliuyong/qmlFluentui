import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../../BizComponent"
import "../../BizBaseComponent/BaseComp"
import "../../LayoutTemplate/TopBottomSplit"
BizBaseTabItem {
    id: root
    anchors.fill: parent
    title: "部门详情"
    objectName: "deptManager"

    Rectangle{
        anchors.fill: parent
        color: "red"
    }
}
