// BaseLayout/qml/LayoutTemplate/LayoutHeaderBodyFooterTemp.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls // 必须引入，用于 ScrollView
import "../FluComponent"
import FluentUI
ColumnLayout {
    id: baseRoot

    spacing: kSpacing
    Layout.margins: kMargin

    /* ========= 常量配置 ========= */
    readonly property int kMargin: 10
    readonly property int kSpacing: 10

    readonly property int kHeaderMinH: 60
    readonly property int kBodyMinH: 200
    readonly property int kFooterMinH: 60
    readonly property int kLayoutMinW: 800

    onHeightChanged: {
        console.log("height",height)
    }

    property int headerWeight: 2
    property int bodyWeight: 6
    property int footerWeight: 1
    // 计算影响因子
    property real _pixelPerRatio: (baseRoot.width - kSpacing) /
                                  (headerWeight+bodyWeight+footerWeight)

    /* ========= 对外插槽 ========= */
    property alias headerContent: headerContainer.data
    property alias bodyContent: bodyContainer.data
    property alias footerContent: footerContainer.data

    readonly property int staticMinHeight:
        (kMargin * 2) + (kSpacing * 2) + kHeaderMinH + kBodyMinH + kFooterMinH

    readonly property int staticMinWidth:
        kLayoutMinW + (kMargin * 2)

    /* ================= HEADER ================= */
    FluShadowGroupBox {
        title: "Header"

        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.preferredHeight: headerWeight*_pixelPerRatio
        Layout.minimumHeight: kHeaderMinH
        Layout.minimumWidth: kLayoutMinW


        FluRectangle {
            id: headerContainer
            anchors.fill: parent
            anchors.margins: 10
            radius: 4
            clip: true
        }
    }

    /* ================= BODY (滚动区) ================= */
    FluShadowGroupBox {
        title: "Body"
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.preferredHeight: bodyWeight*_pixelPerRatio
        Layout.minimumHeight: kBodyMinH
        Layout.minimumWidth: kLayoutMinW



        ScrollView {
            id: bodyScrollView
            anchors.fill: parent
            anchors.margins: 2 // 避免遮挡边框

            ScrollBar.horizontal.policy: ScrollBar.AsNeeded
            ScrollBar.vertical.policy: ScrollBar.AsNeeded

            // 3. 内部容器：Item
            // 宽度绑定 ScrollView 可用宽度，高度由内容撑开
            Item {
                id: bodyContainer
                width: bodyScrollView.availableWidth
                implicitHeight: childrenRect.height
                clip: true
            }

        }
    }

    /* ================= FOOTER ================= */
    FluShadowGroupBox {
        title: "Footer"
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.preferredHeight: footerWeight*_pixelPerRatio
        Layout.minimumHeight: kFooterMinH
        Layout.minimumWidth: kLayoutMinW



        // 4. 内部容器：Item，使用 anchors 填满
        Item {
            id: footerContainer
            anchors.fill: parent
            anchors.margins: 10
            clip: true
        }

    }
}
