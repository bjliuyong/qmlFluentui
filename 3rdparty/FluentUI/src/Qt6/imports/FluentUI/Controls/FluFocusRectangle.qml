import QtQuick
import QtQuick.Controls
import FluentUI

Item {
    property int radius: 4
    id:control
    anchors.fill: parent
    Rectangle{
        width: control.width
        height: control.height
        anchors.centerIn: parent
        color: "#00000000"
        border.width: 2
        radius: control.radius
        border.color:  FluTheme.textHighlightColor
        z: 65535
    }
}

