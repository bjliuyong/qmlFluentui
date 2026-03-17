import QtQuick 2.15
import QtQuick.Controls 2.15
import FluentUI 1.0

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

