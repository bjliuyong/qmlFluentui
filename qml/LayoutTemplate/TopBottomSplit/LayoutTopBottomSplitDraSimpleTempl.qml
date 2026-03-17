import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI

/**
 * @file   LayoutTopBottomSplitDraTabSimpleTempl.qml
 * @date   2026-03-09
 * @author 邓玉荣
 * @brief  上下两段式简单布局，上段按钮区，下段业务页面
 */

Item {
    id: baseRoot
    anchors.fill: parent

    /* ========= 常量配置 ========= */
    readonly property int kMargin: 10
    readonly property int kSpacing: 10
    readonly property int kTopMinH: 60
    readonly property int kBottomMinW: 300
    readonly property int kBottomMinH: 300

    readonly property int staticMinHeight: (kMargin * 2) + kSpacing + kTopMinH + kBottomMinH
    readonly property int staticMinWidth: (kMargin * 2) + kSpacing + kBottomMinW

    implicitWidth: staticMinWidth
    implicitHeight: staticMinHeight

    property int topWeight: 1
    property int bottomWeight: 9

    property real _pixelPerRatioH: Math.max(0, baseRoot.height) / (topWeight + bottomWeight)

    /* ========= 对外插槽 ========= */
    property alias topContent: topContainer.data
    property alias bottomContent: bottomContainer.data
    property alias dialogContent: dialogContainer.data
    // property bool editStatus: false

    Item {
        id: dialogContainer
        z: 999
        anchors.fill: parent
        visible: children.length > 0
        Component.onCompleted: baseRoot.updateDialogMap()
        onChildrenChanged: baseRoot.updateDialogMap()
    }

    /* ========= 布局实现 ========= */
    ColumnLayout {
        id: mainSplit
        anchors.fill: parent
        anchors.margins: kMargin
        spacing: kSpacing

        /* --- Top (Fixed) --- */
        FluShadowGroupBox {
            // 【关键修复】显式禁用 fillHeight
            Layout.fillHeight: false
            Layout.fillWidth: true
            Layout.preferredHeight: topWeight * _pixelPerRatioH
            Layout.minimumHeight: kTopMinH

            Item { id: topContainer; anchors.fill: parent; anchors.margins: 10; clip: true }
        }

        /* --- Bottom (Draggable) --- */

        FluShadowGroupBox {
            SplitView.fillWidth: true
            SplitView.fillHeight: true
            SplitView.minimumHeight: kBottomMinH
            Item { id: bottomContainer; anchors.fill: parent; anchors.margins: 10; clip: true }
        }
    }
}
