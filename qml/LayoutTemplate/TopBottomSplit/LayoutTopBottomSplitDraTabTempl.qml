import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import FluentUI
import "../../FluComponent"
// import BiisPlugins
Item {
    id: baseRoot
    anchors.fill: parent

    /* ========= 0. 样式配置 ========= */

    property int bottomRightTopTabStyle: 1
    property int bottomRightBottomTabStyle: 0

    /* ========= 1. 联动配置 (新增) ========= */
    // 开启右上和右下区域的标签切换联动
    property bool enableTabSync: true

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
    property alias bottomLeftContent: bottomLeftContainer.data
    property alias bottomRightTopContent: baseRoot._rtItems
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
        if (style === 1) return compTabView;
        if (style === 2) return compStack;
        return compPivot;
    }

    /* ========= 6. 联动逻辑核心 (新增) ========= */
    // 监听 右上(RT) 变化 -> 同步给 右下(RB)
    Connections {
        target: (enableTabSync && rtLoader.item) ? rtLoader.item : null
        function onCurrentIndexChanged() {
            var sourceIndex = rtLoader.item.currentIndex
            if (rbLoader.item && rbLoader.item.currentIndex !== sourceIndex) {
                rbLoader.item.currentIndex = sourceIndex
            }
        }
    }

    // 监听 右下(RB) 变化 -> 同步给 右上(RT)
    Connections {
        target: (enableTabSync && rbLoader.item) ? rbLoader.item : null
        function onCurrentIndexChanged() {
            var sourceIndex = rbLoader.item.currentIndex
            if (rtLoader.item && rtLoader.item.currentIndex !== sourceIndex) {
                rtLoader.item.currentIndex = sourceIndex
            }
        }
    }

    /* ========= 7. 组件定义 ========= */
    Component {
        id: compPivot
        FluPivot {
            anchors.fill: parent
            anchors.margins: 0;anchors.leftMargin: 10;
            headerHeight: 36
            font: Qt.font({ family: FluTextStyle.Body.family, pixelSize: 15, weight: Font.Normal })
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

        Item {
            id: customStack
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.topMargin: 10
            clip: true

            property int currentIndex: 0
            property var tabItems: modelData
            
            property real offsetIndex: Math.max(0, currentIndex)
            Behavior on offsetIndex {
                enabled: FluTheme.animationEnabled
                NumberAnimation { duration: 350; easing.type: Easing.OutCubic }
            }

            Repeater {
                // 使用新的变量名
                model: customStack.tabItems

                Item {
                    id: pageWrapper
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: parent.width

                    x: (index - customStack.offsetIndex) * width

                    visible: Math.abs(index - customStack.offsetIndex) < 0.999 || index === customStack.currentIndex

                    Loader {
                        anchors.fill: parent
                        // 【核心修复 2】：统一使用 customStack.tabItems[index] 来获取正确的元素
                        sourceComponent: (customStack.tabItems[index] && customStack.tabItems[index].contentItem) ? customStack.tabItems[index].contentItem : undefined
                    }

                    Component.onCompleted: {
                        // 【核心修复 3】：同理，使用 customStack.tabItems[index]
                        var proxy = customStack.tabItems[index]
                        if (proxy && proxy.contentItem === undefined) {
                            proxy.parent = pageWrapper
                            proxy.anchors.fill = pageWrapper
                        }
                    }
                }
            }
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

        /* --- Bottom --- */
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            FluSplitLayout {
                anchors.fill: parent
                orientation: Qt.Horizontal

                /* --- Bottom Left --- */
                FluShadowGroupBox {
                    SplitView.fillHeight: true
                    SplitView.preferredWidth: (parent.width / (bottomLeftWeight + bottomRightWeight)) * bottomLeftWeight
                    SplitView.minimumWidth: kBottomLeftMinW
                    SplitView.minimumHeight: kBottomLeftMinH
                    Item { id: bottomLeftContainer; anchors.fill: parent; anchors.margins: 10; clip: true }
                }

                /* --- Bottom Right --- */
                Item {
                    SplitView.fillHeight: true
                    SplitView.fillWidth: true
                    FluSplitLayout {
                        anchors.fill: parent
                        orientation: Qt.Vertical

                        /* --- Right Top --- */
                        FluShadowGroupBox {
                            SplitView.fillWidth: true
                            SplitView.preferredHeight: (parent.height / (bottomRightTopWeight + bottomRightBottomWeight)) * bottomRightTopWeight
                            SplitView.minimumHeight: kBottomRightTopMinH

                            title:  ""

                            Loader {
                                id: rtLoader // 新增ID
                                anchors.fill: parent
                                property var modelData: baseRoot._rtItems
                                sourceComponent: baseRoot.getTabComponent(baseRoot.bottomRightTopTabStyle)
                            }
                        }

                        /* --- Right Bottom --- */
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
            }
        }
    }
}
