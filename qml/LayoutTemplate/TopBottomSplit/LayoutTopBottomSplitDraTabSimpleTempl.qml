import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI


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
    readonly property int staticMinWidth: (kMargin * 2) + kSpacing + kBottomMinW

    implicitWidth: staticMinWidth
    implicitHeight: staticMinHeight

    property int topWeight: 1
    property int bottomWeight: 9

    property real _pixelPerRatioH: Math.max(0, baseRoot.height) / (topWeight + bottomWeight)
    // property bool editStatus: false

    /* ========= 2. 内容插槽 ========= */
    property list<QtObject> _rtItems

    property alias topContent: topContainer.data
    property alias bottomContent: baseRoot._rtItems
    property alias dialogContent: dialogContainer.data

    /* ========= 3. 注入系统 (AutoWire) ========= */
    // property int _trigger: 0
    // function _onContentChanged() { _trigger++ }

    Component.onCompleted: {
        syncTabs(bottomTabView, _rtItems)
    }

    Item {
        id: dialogContainer
        z: 999
        anchors.fill: parent
        visible: children.length > 0
    }

    function syncTabs(tabView, itemList) {
        if (tabView.count() > 0) return

        for(var i = 0; i < itemList.length; i++) {
            var proxyItem = itemList[i]

            // 1. 获取标题：优先使用 item.title，否则默认 Page N
            var title = "Page " + (i+1)
            if (proxyItem.title !== undefined && proxyItem.title !== "") {
                title = proxyItem.title
            }

            // 2. 获取图标：优先使用 item.icon，否则默认 logo
            var icon = "qrc:/testImage/icon_logo_24.png"
            if (proxyItem.icon !== undefined && proxyItem.icon !== "") {
                icon = proxyItem.icon
            }

            // 3. 添加 Tab
            // 注意：FluTabView.appendTab(icon, title, control, properties)
            tabView.appendTab(
                icon,
                title,
                proxyItem.contentItem,
                {}
            )
        }
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

        /* --- Bottom (Draggable) --- */

        FluShadowGroupBox {
            SplitView.fillWidth: true
            SplitView.fillHeight: true
            SplitView.minimumHeight: kBottomMinH
            title: ""
            FluTabView {
                id: bottomTabView
                anchors.fill: parent
                anchors.margins: 20
                addButtonVisibility: false
                closeButtonVisibility: FluTabViewType.Never
            }
        }
    }
}
