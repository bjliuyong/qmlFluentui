import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI

ColumnLayout{
    id: root
    // anchors.fill: parent
    FluRectangle{
        width: 100
        height: 100
        color: "blue"
    }
    FluCopyableText{
        text: qsTr("RegionUserInfoFooter")
    }
}
