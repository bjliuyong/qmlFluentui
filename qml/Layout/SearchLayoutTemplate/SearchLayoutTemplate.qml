import QtQuick
import QtQuick.Layouts
import "../../BaseComponent"
ColumnLayout {
    id: baseRoot
    anchors.fill: parent
    anchors.margins: 10
    spacing: 10

    property alias headerContent: headerBox.content
    property alias bodyContent: bodyBox.content
    property alias footerContent: footerBox.content
    readonly property real netHeight: height - (anchors.margins * 2) - (spacing * (visibleChildren.length - 1))

    ShadowBox {
        id: headerBox
        title: "Header"
        Layout.preferredHeight: baseRoot.netHeight * 0.2

    }

    ShadowBox {
        id: bodyBox
        title: "Body"
        Layout.preferredHeight: baseRoot.netHeight * 0.5
    }

    ShadowBox {
        id: footerBox
        title: "Footer"
        Layout.preferredHeight: baseRoot.netHeight * 0.3
    }
}
