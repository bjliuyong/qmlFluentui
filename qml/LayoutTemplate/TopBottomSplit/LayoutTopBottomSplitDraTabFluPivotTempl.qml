import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI


/**
 * @file   LayoutTopBottomTabFluPivotTempl.qml
 * @date   2026-03-09 16:14:07
 * @author 刘帅科
 * @brief  上下布局，分页使用FluPivot
 *          tabHeaderHeight为下方tab的标签头高度，设置为0时可以作为普通二的段式使用
*           不可拖动
 */

Item {
    id: baseRoot
    anchors.fill: parent

    /* ========= 1. 尺寸与配置 ========= */
    readonly property int kMargin: 10
    readonly property int kSpacing: 10
    readonly property int kTopMinH: 60
    readonly property int kBottomMinW: 300
    readonly property int kBottomMinH: 300

    readonly property int staticMinHeight: (kMargin * 2) + kSpacing + kTopMinH + kBottomMinH
    readonly property int staticMinWidth: (kMargin * 2)  + kBottomMinW

    implicitWidth: staticMinWidth
    implicitHeight: staticMinHeight

    property int topWeight: 1
    property int bottomWeight: 9
    property int tabHeaderHeight: 36

    property real _pixelPerRatioH: Math.max(0, baseRoot.height) / (topWeight + bottomWeight)
    property bool editStatus: false

    /* ========= 2. 内容插槽 ========= */
    property list<QtObject> _rtItems

    property alias topContent: topContainer.data
    property alias bottomContent: baseRoot._rtItems
    property alias dialogContent: dialogContainer.data


    Item {
        id: dialogContainer
        z: 999
        anchors.fill: parent
        visible: children.length > 0
    }

    /* ========= 5. 布局实现 ========= */
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: kMargin
        spacing: kSpacing

        /* --- Top (Fixed) --- */
        FluShadowGroupBox {
            // 【关键修复】显式禁用 fillHeight，确保 preferredHeight 生效
            Layout.fillHeight: false
            Layout.fillWidth: true
            Layout.preferredHeight: topWeight * _pixelPerRatioH
            Layout.minimumHeight: kTopMinH

            Item { id: topContainer; anchors.fill: parent; anchors.margins: 10; clip: true }
        }

        /* --- Bottom --- */

        FluShadowGroupBox {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: kBottomMinH
            title: ""
            FluPivot {
                id: bottomTabView
                anchors.fill: parent
                anchors.margins: 5;
                headerHeight: tabHeaderHeight
                font: Qt.font({ family: FluTextStyle.Body.family, pixelSize: 15, weight: Font.Normal })
                content: baseRoot._rtItems
            }
        }
    }
}
