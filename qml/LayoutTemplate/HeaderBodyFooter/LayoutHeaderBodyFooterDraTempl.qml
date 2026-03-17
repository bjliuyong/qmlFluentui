import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
// import "../../FluComponent"
// import "../../BizBaseComponent/BaseComp"
import FluentUI


Item {
    id: baseRoot

    Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.margins: kMargin

    readonly property int kMargin: 10
    readonly property int kSpacing: 10
    readonly property int kHeaderMinH: 60
    readonly property int kBodyMinH: 200
    readonly property int kFooterMinH: 60
    readonly property int kLayoutMinW: 800

    implicitWidth: staticMinWidth
    implicitHeight: staticMinHeight

    property int headerWeight: 1
    property int bodyWeight: 6
    property int footerWeight: 3
    property bool editStatus : false

    property real _pixelPerRatio: Math.max(0, baseRoot.height) / (headerWeight + bodyWeight + footerWeight)

    /* ========= 对外插槽 ========= */
    property alias headerContent: headerContainer.data
    property alias bodyContent: bodyContainer.data
    property alias footerContent: footerContainer.data

    /*
    function getHeaderItem() { return _injectedHeader }
    function getBodyItem()   { return _injectedBody }
    function getFooterItem() { return _injectedFooter }
    function getDialogItem(name) { return _dialogMap[name] }
*/

    readonly property int staticMinHeight: (kMargin * 4) + kHeaderMinH + kBodyMinH + kFooterMinH
    readonly property int staticMinWidth: kLayoutMinW + (kMargin * 2)

    property alias dialogContent: dialogContainer.data
    Item {
        id: dialogContainer
        z: 999
        anchors.fill: parent
        visible: children.length > 0
        // Component.onCompleted: baseRoot.updateDialogMap()
        // onChildrenChanged: baseRoot.updateDialogMap()
    }
    /*
    property var _dialogMap: ({})
    function updateDialogMap() {
        var map = {}
        var resList = dialogContainer.resources
        for(var i = 0; i < resList.length; i++) { if (resList[i].objectName) map[resList[i].objectName] = resList[i] }
        var childList = dialogContainer.children
        for(var j = 0; j < childList.length; j++) { if (childList[j].objectName) map[childList[j].objectName] = childList[j] }
        _dialogMap = map
        // autoWire()
    }


    property var _injectedHeader: headerContainer.children.length > 0 ? headerContainer.children[0] : null
    property var _injectedBody:   bodyContainer.children.length > 0   ? bodyContainer.children[0]   : null
    property var _injectedFooter: footerContainer.children.length > 0 ? footerContainer.children[0] : null

    on_InjectedHeaderChanged: autoWire()
    on_InjectedBodyChanged:   autoWire()
    on_InjectedFooterChanged: autoWire()

    function autoWire() {
        if (Object.keys(_dialogMap).length === 0 && (dialogContainer.children.length > 0 || dialogContainer.resources.length > 0)) { updateDialogMap() }
        var targets = []
        if (_injectedHeader) targets.push(_injectedHeader)
        if (_injectedBody)   targets.push(_injectedBody)
        if (_injectedFooter) targets.push(_injectedFooter)
        for (var key in _dialogMap) { if (_dialogMap[key]) targets.push(_dialogMap[key]) }

        targets.forEach(function(target) {
            if (!target) return
            if ("rootContent" in target) target.rootContent = baseRoot
            if ("editStatus" in target) target.editStatus = statusBinding
            if ("dialogContent" in target) target.dialogContent = _dialogMap


            // 注入内容引用
            if ("headerContent" in target) target.headerContent = headerRef
            if ("footerContent" in target) target.footerContent = footerRef
            if ("bodyLeftContent" in target) target.bodyLeftContent = bodyLeftRef

            // 注入 TabView 实例
            if ("bodyRightTopContent" in target) target.bodyRightTopContent = rtTabView
            if ("bodyRightBottomContent" in target) target.bodyRightBottomContent = rbTabView
        })
    }
*/
    //==============================布局

    ColumnLayout {
        id: mainColumn
        anchors.fill: parent
        anchors.margins: kMargin
        spacing: kSpacing

        /* ================= HEADER (Fixed) ================= */
        FluShadowGroupBox {
            // 【关键修复】显式禁用 fillHeight
            Layout.fillHeight: false
            Layout.fillWidth: true
            Layout.preferredHeight: headerWeight * _pixelPerRatio
            Layout.minimumHeight: kHeaderMinH
            Layout.minimumWidth: kLayoutMinW

            Item {
                id: headerContainer
                anchors.fill: parent
                anchors.margins: 10
                clip: true
            }
        }

        /* ================= BODY & FOOTER (Draggable) ================= */
        // 将 Body 和 Footer 放入 SplitLayout 保持它们之间可拖动
        FluSplitLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            orientation: Qt.Vertical

            /* --- Body --- */
            FluShadowGroupBox {
                SplitView.fillWidth: true
                SplitView.fillHeight: true
                SplitView.minimumHeight: kBodyMinH
                SplitView.minimumWidth: kLayoutMinW
                Item {
                    id: bodyContainer
                    anchors.fill: parent
                    anchors.margins: 10
                    clip: true
                }
            }

            /* --- Footer --- */
            FluShadowGroupBox {
                SplitView.fillWidth: true
                // Footer 作为 SplitView 子项，保持默认行为
                SplitView.preferredHeight: footerWeight * _pixelPerRatio
                SplitView.minimumHeight: kFooterMinH
                SplitView.minimumWidth: kLayoutMinW
                Item {
                    id: footerContainer
                    anchors.fill: parent
                    anchors.margins: 10
                    clip: true
                }
            }
        }
    }
}
