// BaseLayout/qml/LayoutTemplate/LayoutHeaderBodyFooterTempDraggable.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "../FluComponent"
import FluentUI

Item {
    id: baseRoot


    Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.margins: kMargin

    readonly property int kMargin: 10
    readonly property int kSpacing: 0
    readonly property int kHeaderMinH: 60
    readonly property int kBodyMinH: 200
    readonly property int kFooterMinH: 60
    readonly property int kLayoutMinW: 800

    implicitWidth: staticMinWidth
    implicitHeight: staticMinHeight

    property int headerWeight: 1
    property int bodyWeight: 6
    property int footerWeight: 3

    // 保持比例计算，用于给 Header 和 Footer 赋初始值
    property real _pixelPerRatio: Math.max(0, baseRoot.height - (2 * kSpacing)) /
                                  (headerWeight + bodyWeight + footerWeight)

    /* ========= 对外插槽 ========= */
    property alias headerContent: headerContainer.data
    property alias bodyContent: bodyContainer.data
    property alias footerContent: footerContainer.data

    readonly property int staticMinHeight: (kMargin * 2) + kHeaderMinH + kBodyMinH + kFooterMinH
    readonly property int staticMinWidth: kLayoutMinW + (kMargin * 2)

    //=====================方案A常用信号模板层声明好================
    /*
    property var _injectedHeader: headerContainer.children.length > 0 ? headerContainer.children[0] : null
    property var _injectedFooter: footerContainer.children.length > 0 ? footerContainer.children[0] : null


    property var onEditStatusChangedAction: editStatusChangedMethod
    function editStatusChangedMethod(headerItem, footerItem) {
            if (footerItem) {
                console.log("正在操作 Footer...")
                footerItem.setName("来自模板的修改")
            }
    }
    // 3. 自动连接 Footer 的提交信号
    Connections {
        id: cancleSignal
        target: _injectedHeader
        ignoreUnknownSignals: true

        function onChangedEditStatus() {
            console.log("[Template] 检测到 Header 编辑状态变更...")
            // 【第二步】判断外部有没有传入自定义函数
            if (baseRoot.onEditStatusChangedAction && typeof baseRoot.onEditStatusChangedAction === "function") {
                // 【关键点】把模板内部的私有对象 (_injectedFooter, _injectedHeader) 传给外部函数
                // 这样外部函数才能操作这些内部控件
                baseRoot.onEditStatusChangedAction(_injectedHeader, _injectedFooter)
            } else {
                // (可选) 如果外部没传函数，执行默认逻辑
                console.log("[Template] 执行默认逻辑")
                if (_injectedHeader && _injectedFooter && typeof _injectedFooter.setName === "function") {
                    _injectedFooter.setName("test")
                }
            }
        }
    }

    */


    //================================方案B模板层面的自动注入
    /*
    property var _injectedHeader: headerContainer.children[0] || null
    property var _injectedFooter: footerContainer.children[0] || null

    // 监听注入对象变化，一旦就位，开始连线
    on_InjectedHeaderChanged: autoWire()
    on_InjectedFooterChanged: autoWire()

    function autoWire() {
        if (_injectedHeader && _injectedFooter) {
            console.log("[Template] 开始自动装配 Header 和 Footer...")

            // 1. 把 Footer 塞给 Header (如果 Header 有 contextFooter 属性)
            if ("contextFooter" in _injectedHeader) {
                _injectedHeader.contextFooter = _injectedFooter
            }
            // 2. 把 Header 塞给 Footer (如果 Footer 有 contextHeader 属性)
            if ("contextHeader" in _injectedFooter) {
                _injectedFooter.contextHeader = _injectedHeader
            }
        }
    }
*/


    FluSplitLayout {
        id: splitView
        anchors.fill: parent
        anchors.margins: kMargin
        orientation: Qt.Vertical


        FluShadowGroupBox {

            SplitView.fillWidth: true

            // Header 保持使用 preferredHeight 设置初始大小
            SplitView.preferredHeight: headerWeight * _pixelPerRatio
            SplitView.minimumHeight: kHeaderMinH
            SplitView.minimumWidth: kLayoutMinW

            FluRectangle {
                id: headerContainer
                anchors.fill: parent
                anchors.margins: 10
                radius: 4
                clip: true
            }
        }

        /* ================= BODY (核心修改) ================= */
        FluShadowGroupBox {

            SplitView.fillWidth: true


            SplitView.fillHeight: true


            SplitView.minimumHeight: kBodyMinH
            SplitView.minimumWidth: kLayoutMinW

            ScrollView {
                id: bodyScrollView
                anchors.fill: parent
                anchors.margins: 2
                clip: true

                ScrollBar.horizontal.policy: ScrollBar.AsNeeded
                ScrollBar.vertical.policy: ScrollBar.AsNeeded

                Item {
                    id: bodyContainer
                    width: bodyScrollView.availableWidth
                    implicitHeight: childrenRect.height
                }
            }
        }

        /* ================= FOOTER ================= */
        FluShadowGroupBox {

            SplitView.fillWidth: true

            // Footer 保持使用 preferredHeight 设置初始大小
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
