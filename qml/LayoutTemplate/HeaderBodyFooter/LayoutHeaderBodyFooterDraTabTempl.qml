import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import FluentUI

Item {
    id: baseRoot
    anchors.fill: parent

    /* ========= 0. 样式配置 ========= */


    property int bodyTabStyle: 0
    property int footerTabStyle: 2

    /* ========= 1. 联动配置 (新增) ========= */
    // 开启 Body 和 Footer 的标签切换联动
    property bool enableTabSync: true

    // 方法：手动开启或关闭联动
    function setTabSync(enable) {
        baseRoot.enableTabSync = enable
    }

    /* ========= 2. 尺寸与配置 ========= */
    readonly property int kMargin: 10
    readonly property int kSpacing: 10
    readonly property int kHeaderMinH: 60
    readonly property int kBodyMinH: 200
    readonly property int kFooterMinH: 100

    readonly property int staticMinHeight: (kMargin * 2) + kSpacing + kHeaderMinH + kBodyMinH + kSpacing + kFooterMinH
    readonly property int staticMinWidth: 800

    implicitWidth: staticMinWidth
    implicitHeight: staticMinHeight

    property int headerWeight: 1
    property int bodyWeight: 7
    property int footerWeight: 2

    property real _pixelPerRatio: Math.max(0, baseRoot.height) / (headerWeight + bodyWeight + footerWeight)

    /* ========= 3. 内容插槽 ========= */
    property list<QtObject> _bodyItems
    property list<QtObject> _footerItems
    property list<Item> _headerItems

    property alias headerContent: baseRoot._headerItems
    property alias bodyContent: baseRoot._bodyItems
    property alias footerContent: baseRoot._footerItems
    property alias dialogContent: dialogContainer.data

    Item {
        id: dialogContainer
        z: 999
        anchors.fill: parent
        visible: children.length > 0
    }

    property Component headerDelegate: defaultHeaderDelegate
    property Component defaultHeaderDelegate: Component {
        FluShadowGroupBox {
            Item {
                id: defHeader
                anchors.fill: parent; anchors.margins: 10; clip: true
                Component.onCompleted: {
                    for(var i=0; i<baseRoot._headerItems.length; i++) {
                        if(baseRoot._headerItems[i]) baseRoot._headerItems[i].parent = defHeader
                    }
                }
            }
        }
    }

    /* ========= 4. 逻辑处理 ========= */
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

    /* ========= 5. 联动逻辑核心 (新增) ========= */
    // 监听 Body 变化 -> 同步给 Footer
    Connections {
        target: (enableTabSync && bodyLoader.item) ? bodyLoader.item : null
        function onCurrentIndexChanged() {
            var sourceIndex = bodyLoader.item.currentIndex
            // 只有当 Footer 存在且索引不同时才同步
            if (footerLoader.item && footerLoader.item.currentIndex !== sourceIndex) {
                 // 简单的越界保护 (虽然 QML 通常会自动处理，但加一层更稳妥)
                footerLoader.item.currentIndex = sourceIndex
            }
        }
    }

    // 监听 Footer 变化 -> 同步给 Body
    Connections {
        target: (enableTabSync && footerLoader.item) ? footerLoader.item : null
        function onCurrentIndexChanged() {
            var sourceIndex = footerLoader.item.currentIndex
            if (bodyLoader.item && bodyLoader.item.currentIndex !== sourceIndex) {
                bodyLoader.item.currentIndex = sourceIndex
            }
        }
    }

    /* ========= 6. 组件定义 ========= */
    Component {
        id: compPivot
        FluPivot {
            anchors.fill: parent
            anchors.margins: 0; anchors.leftMargin: 10;
            headerHeight: 36

            font: Qt.font({ family: FluTextStyle.Body.family, pixelSize: FluTextStyle.Body.pixelSize, weight: Font.Normal })
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
            clip: true // 开启裁剪

            property int currentIndex: 0
            property real offsetIndex: Math.max(0, currentIndex)
            Behavior on offsetIndex {
                enabled: FluTheme.animationEnabled
                NumberAnimation { duration: 350; easing.type: Easing.OutCubic }
            }

            Repeater {
                model: modelData

                Item {
                    id: pageWrapper
                    // 解除全屏锚定，允许 X 轴移动
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: parent.width

                    // 【核心：智能空间排列】
                    x: (index - customStack.offsetIndex) * width

                    visible: Math.abs(index - customStack.offsetIndex) < 0.999 || index === customStack.currentIndex

                    // 原有的内容挂载逻辑
                    Loader {
                        anchors.fill: parent
                        sourceComponent: (modelData[index] && modelData[index].contentItem) ? modelData[index].contentItem : undefined
                    }

                    Component.onCompleted: {
                        var proxy = modelData[index]
                        if (proxy && proxy.contentItem === undefined) {
                            proxy.parent = pageWrapper
                            proxy.anchors.fill = pageWrapper
                        }
                    }
                }
            }
        }
    }

    /* ========= 7. 布局实现 ========= */
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: kMargin
        spacing: kSpacing

        /* --- Header --- */
        Loader {
            Layout.fillHeight: false
            Layout.fillWidth: true
            Layout.preferredHeight: headerWeight * _pixelPerRatio
            Layout.minimumHeight: kHeaderMinH
            sourceComponent: baseRoot.headerDelegate
            onLoaded: if(item) { item.anchors.fill = item.parent }
        }

        /* --- Split Area --- */
        FluSplitLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            orientation: Qt.Vertical

            /* --- Body --- */
            FluShadowGroupBox {
                SplitView.fillWidth: true
                SplitView.fillHeight: true
                SplitView.minimumHeight: kBodyMinH
                title:  ""

                Loader {
                    id: bodyLoader // 新增ID
                    anchors.fill: parent
                    property var modelData: baseRoot._bodyItems
                    sourceComponent: baseRoot.getTabComponent(baseRoot.bodyTabStyle)
                }
            }

            /* --- Footer --- */
            FluShadowGroupBox {
                SplitView.fillWidth: true
                SplitView.preferredHeight: footerWeight * _pixelPerRatio
                SplitView.minimumHeight: kFooterMinH
                title:  ""

                Loader {
                    id: footerLoader // 新增ID
                    anchors.fill: parent
                    property var modelData: baseRoot._footerItems
                    sourceComponent: baseRoot.getTabComponent(baseRoot.footerTabStyle)
                }
            }
        }
    }
}
