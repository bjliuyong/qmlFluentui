import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "../../FluComponent"
import FluentUI

Item {
    id: baseRoot

    anchors.fill: parent

    /* ========= 常量配置 ========= */
    readonly property int kMargin: 10
    // SplitLayout 的 handle 宽度/高度通常由样式决定，这里预留 spacing
    readonly property int kSpacing: 10

    readonly property int kTopMinH: 60
    readonly property int kBottomLeftMinW: 100
    readonly property int kBottomLeftMinH: 200
    readonly property int kBottomRightMinW: 200
    readonly property int kBottomRightTopMinH: 100
    readonly property int kBottomRightBottomMinH: 100

    /* ========= 关键补充：暴露静态最小尺寸 ========= */
    // 参考原 Draggable 模板使用了 (kMargin * 4) 可能是为了给 handle 留余量
    readonly property int staticMinHeight:
        (kMargin * 2) + kSpacing + kTopMinH +
        Math.max(kBottomLeftMinH, kBottomRightTopMinH + kSpacing + kBottomRightBottomMinH)

    readonly property int staticMinWidth:
        (kMargin * 2) + kSpacing + kBottomLeftMinW + kBottomRightMinW

    // 隐式大小，让父级容器能感知
    implicitWidth: staticMinWidth
    implicitHeight: staticMinHeight

    /* ========= 布局权重 ========= */
    property int topWeight: 1
    property int bottomWeight: 9
    property int bottomLeftWeight: 3
    property int bottomRightWeight: 7
    property int bottomRightTopWeight: 1
    property int bottomRightBottomWeight: 1

    property real _pixelPerRatioH: Math.max(0, baseRoot.height) / (topWeight + bottomWeight)

    /* ========= 对外插槽 & 注入系统 ========= */
    property alias topContent: topContainer.data
    property alias bottomLeftContent: bottomLeftContainer.data
    property alias bottomRightTopContent: bottomRightTopContainer.data
    property alias bottomRightBottomContent: bottomRightBottomContainer.data
    property alias dialogContent: dialogContainer.data
    property bool editStatus: false

    Item {
        id: dialogContainer
        z: 999
        anchors.fill: parent
        visible: children.length > 0
        Component.onCompleted: baseRoot.updateDialogMap()
        onChildrenChanged: baseRoot.updateDialogMap()
    }

    // ... (保留 updateDialogMap 和 autoWire 函数，同前文) ...
    property var _dialogMap: ({})
    function updateDialogMap() {
        var map = {}
        var resList = dialogContainer.resources
        for(var i=0; i<resList.length; i++) {
             if(resList[i].objectName) map[resList[i].objectName] = resList[i]
        }
        var childList = dialogContainer.children
        for(var j=0; j<childList.length; j++) {
             if(childList[j].objectName) map[childList[j].objectName] = childList[j]
        }
        _dialogMap = map
        autoWire()
    }

    property var _injectedTop: topContainer.children.length > 0 ? topContainer.children[0] : null
    property var _injectedBottomLeft: bottomLeftContainer.children.length > 0 ? bottomLeftContainer.children[0] : null
    property var _injectedBottomRightTop: bottomRightTopContainer.children.length > 0 ? bottomRightTopContainer.children[0] : null
    property var _injectedBottomRightBottom: bottomRightBottomContainer.children.length > 0 ? bottomRightBottomContainer.children[0] : null

    on_InjectedTopChanged: autoWire()
    on_InjectedBottomLeftChanged: autoWire()
    on_InjectedBottomRightTopChanged: autoWire()
    on_InjectedBottomRightBottomChanged: autoWire()

    function autoWire() {
        if (Object.keys(_dialogMap).length === 0 && (dialogContainer.children.length > 0 || dialogContainer.resources.length > 0)) {
            updateDialogMap()
        }
        var targets = []
        if (_injectedTop) targets.push(_injectedTop)
        if (_injectedBottomLeft) targets.push(_injectedBottomLeft)
        if (_injectedBottomRightTop) targets.push(_injectedBottomRightTop)
        if (_injectedBottomRightBottom) targets.push(_injectedBottomRightBottom)
        for (var key in _dialogMap) { if (_dialogMap[key]) targets.push(_dialogMap[key]) }

        targets.forEach(function(target) {
            // 需要确保你的子组件有对应的 property
            if ("topContent" in target) target.topContent = _injectedTop
            if ("bottomLeftContent" in target) target.bottomLeftContent = _injectedBottomLeft
            if ("bottomRightTopContent" in target) target.bottomRightTopContent = _injectedBottomRightTop
            if ("bottomRightBottomContent" in target) target.bottomRightBottomContent = _injectedBottomRightBottom
            if ("dialogContent" in target) target.dialogContent = _dialogMap
            if ("rootContent" in target) target.rootContent = baseRoot
            if ("editStatus" in target) target.editStatus = Qt.binding(function() { return baseRoot.editStatus })
        })
    }

    /* ========= 布局实现 ========= */
    FluSplitLayout {
        id: mainSplit
        anchors.fill: parent
        anchors.margins: kMargin
        orientation: Qt.Vertical

        /* --- Top --- */
        FluShadowGroupBox {
            SplitView.fillWidth: true
            SplitView.preferredHeight: topWeight * _pixelPerRatioH
            SplitView.minimumHeight: kTopMinH

            Item { id: topContainer; anchors.fill: parent; anchors.margins: 10; clip: true }
        }

        /* --- Bottom Container --- */
        Item {
            SplitView.fillWidth: true
            SplitView.fillHeight: true

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

                /* --- Bottom Right Container --- */
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

                            Item { id: bottomRightTopContainer; anchors.fill: parent; anchors.margins: 10; clip: true }
                        }

                        /* --- Right Bottom --- */
                        FluShadowGroupBox {
                            SplitView.fillWidth: true
                            SplitView.fillHeight: true
                            SplitView.minimumHeight: kBottomRightBottomMinH

                            Item { id: bottomRightBottomContainer; anchors.fill: parent; anchors.margins: 10; clip: true }
                        }
                    }
                }
            }
        }
    }
}
