// SearchLayoutTemplate.qml
import QtQuick
import QtQuick.Layouts
import "../FluComponent"

ColumnLayout {
    id: baseRoot

    spacing: kSpacing
    Layout.margins: kMargin

    /* ========= 常量 ========= */
    readonly property int kMargin: 10
    readonly property int kSpacing: 10
    readonly property int kHeaderMinH: 60
    readonly property int kBodyMinH: 200
    readonly property int kFooterMinH: 100
    readonly property int kLayoutMinW: 800

    /* ========= 高度权重（不是百分比！） ========= */
    property int headerWeight: 2
    property int bodyWeight:   5
    property int footerWeight: 3

    /* ========= 对外插槽 ========= */
    property alias headerContent: headerContainer.data
    property alias bodyContent: bodyContainer.data
    property alias footerContent: footerContainer.data

    readonly property int staticMinHeight:
        (kMargin * 2) + (kSpacing * 2)
        + kHeaderMinH + kBodyMinH + kFooterMinH

    readonly property int staticMinWidth:
        kLayoutMinW + (kMargin * 2)

    /* ================= HEADER ================= */
    FluShadowGroupBox {
        title: "Header"

        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.preferredHeight: headerWeight   // ⭐ 权重
        Layout.minimumHeight: kHeaderMinH
        Layout.minimumWidth: kLayoutMinW

        ColumnLayout {
            id: headerContainer
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

    /* ================= BODY ================= */
    FluShadowGroupBox {
        title: "Body"

        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.preferredHeight: bodyWeight     // ⭐ 权重
        Layout.minimumHeight: kBodyMinH
        Layout.minimumWidth: kLayoutMinW

        ColumnLayout {
            id: bodyContainer
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

    /* ================= FOOTER ================= */
    FluShadowGroupBox {
        title: "Footer"

        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.preferredHeight: footerWeight   // ⭐ 权重
        Layout.minimumHeight: kFooterMinH
        Layout.minimumWidth: kLayoutMinW

        ColumnLayout {
            id: footerContainer
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
