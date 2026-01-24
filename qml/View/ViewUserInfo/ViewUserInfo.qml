import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import "../../LayoutTemplate"

ColumnLayout {
    anchors.fill: parent

    LayoutHeaderBodyFooterTemp {
        id: searchLayout

        Layout.fillWidth: true
        Layout.fillHeight: true
        headerContent: RegionUserInfoHeader{}
        bodyContent: RegionUserInfoBody{}
        footerContent: RegionUserInfoFooter{}
    }
}
