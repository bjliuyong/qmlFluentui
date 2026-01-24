import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import "../../LayoutComponent"

ColumnLayout {
    anchors.fill: parent

    LayoutHeaderBodyFooterTemp {
        id: searchLayout

        Layout.fillWidth: true
        Layout.fillHeight: true
        headerContent: RegionUserInfoHeader{}
    }
}
