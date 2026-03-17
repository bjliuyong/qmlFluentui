import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "../../FluComponent"
import FluentUI

Item {
    id: baseRoot
    anchors.fill: parent

    /* ========= 0. 样式配置 ========= */
    QtObject {
        id: tabStyle
        readonly property int pivot: 0
        readonly property int tabView: 1
        readonly property int stack: 2
    }

    property int bottomRightTopTabStyle: tabStyle.pivot
    property int bottomRightBottomTabStyle: tabStyle.pivot

    /* ========= 1. 联动配置 (新增) ========= */
    // 开启右上和右下区域的标签切换联动
    property bool enableTabSync: false

    function setTabSync(enable) {
        baseRoot.enableTabSync = enable
    }

    /* ========= 2. 尺寸与配置 ========= */
    readonly property int kMargin: 10
    readonly property int kSpacing: 10
    readonly property int kTopMinH: 60
    readonly property int kBottomLeftMinW: 100
    readonly property int kBottomLeftMinH: 200
    readonly property int kBottomRightMinW: 200
    readonly property int kBottomRightTopMinH: 100
    readonly property int kBottomRightBottomMinH: 100

    readonly property int staticMinHeight: (kMargin * 2) + kSpacing + kTopMinH + Math.max(kBottomLeftMinH, kBottomRightTopMinH + kSpacing + kBottomRightBottomMinH)
    readonly property int staticMinWidth: (kMargin * 2) + kSpacing + kBottomLeftMinW + kBottomRightMinW

    implicitWidth: staticMinWidth
    implicitHeight: staticMinHeight

    property int topWeight: 1
    property int bottomWeight: 9
    property int bottomLeftWeight: 3
    property int bottomRightWeight: 7
    property int bottomRightTopWeight: 1
    property int bottomRightBottomWeight: 1

    property real _pixelPerRatioH: Math.max(0, baseRoot.height) / (topWeight + bottomWeight)

    /* ========= 3. 内容插槽 ========= */
    property list<QtObject> _rtItems
    property list<QtObject> _rbItems

    property alias topContent: topContainer.data
    //property alias bottomLeftContent: bottomLeftContainer.data
    //property alias bottomRightTopContent: baseRoot._rtItems
    property alias bottomRightBottomContent: baseRoot._rbItems
    property alias dialogContent: dialogContainer.data

    /* ========= 4. 辅助组件 ========= */
    Item {
        id: dialogContainer
        z: 999
        anchors.fill: parent
        visible: children.length > 0
    }

    /* ========= 5. 逻辑处理 ========= */
    function syncTabs(tabView, itemList) {
        if (tabView.count() > 0) return
        for(var i = 0; i < itemList.length; i++) {
            var proxyItem = itemList[i]
            var title = (proxyItem.title !== undefined && proxyItem.title !== "") ? proxyItem.title : "Page " + (i+1)
            var icon = (proxyItem.icon !== undefined && proxyItem.icon !== "") ? proxyItem.icon : "qrc:/testImage/icon_logo_24.png"
            var content = proxyItem.contentItem ? proxyItem.contentItem : proxyItem
            tabView.appendTab(icon, title, content, {})
        }
    }

    function syncStack(stackView, itemList) {
        if (stackView.children.length > 0) return
        for(var i = 0; i < itemList.length; i++) {
            var proxyItem = itemList[i]
            var contentComponent = proxyItem.contentItem
            if (contentComponent) {
                var loader = Qt.createQmlObject('import QtQuick; Loader { anchors.fill: parent }', stackView)
                loader.sourceComponent = contentComponent
            } else {
                proxyItem.parent = stackView
            }
        }
    }

    function getTabComponent(style) {
        if (style === tabStyle.tabView) return compTabView;
        if (style === tabStyle.stack) return compStack;
        return compPivot;
    }

    /* ========= 7. 组件定义 ========= */
    Component {
        id: compPivot
        FluPivot {
            anchors.fill: parent
            anchors.margins: 0;anchors.leftMargin: 10;
            headerHeight: 36
            font: Qt.font({ family: FluTextStyle.Body.family, pixelSize: 15, weight: Font.DemiBold })
            content: modelData
        }
    }
    Component {
        id: compTabView
        FluTabView {
            anchors.fill: parent
            anchors.margins: 0;anchors.leftMargin: 10;
            addButtonVisibility: false
            closeButtonVisibility: FluTabViewType.Never
            Component.onCompleted: baseRoot.syncTabs(this, modelData)
        }
    }
    Component {
        id: compStack
        StackLayout {
            anchors.fill: parent
            currentIndex: 0
            anchors.leftMargin: 10;
            anchors.topMargin: 10;
            Component.onCompleted: baseRoot.syncStack(this, modelData)
        }
    }

    /* ========= 8. 布局实现 ========= */
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: kMargin
        spacing: kSpacing

        /* --- Top --- */
        FluShadowGroupBox {
            Layout.fillHeight: false
            Layout.fillWidth: true
            Layout.preferredHeight: topWeight * _pixelPerRatioH
            Layout.minimumHeight: kTopMinH
            Item { id: topContainer; anchors.fill: parent; anchors.margins: 10; clip: true }
        }

        FluShadowGroupBox {
            SplitView.fillWidth: true
            SplitView.fillHeight: true
            SplitView.minimumHeight: kBottomRightBottomMinH
            title: ""

            Loader {
                id: rbLoader // 新增ID
                anchors.fill: parent
                property var modelData: baseRoot._rbItems
                sourceComponent: baseRoot.getTabComponent(baseRoot.bottomRightBottomTabStyle)
            }
        }
    }
}
