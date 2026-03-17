import QtQuick
import QtQuick.Controls
import FluentUI

SplitView {
    property color handleColor :  FluTheme.handleColor
    id:control
    QtObject{
        id:d
        property bool isVertical: control.orientation === Qt.Vertical
    }
    handle: Rectangle {
        implicitWidth: d.isVertical ? control.width : 12
        implicitHeight: d.isVertical ? 12 : control.height
        clip: true
        color: {
            if(SplitHandle.pressed){
                return FluTheme.itemPressColor
            }
            return SplitHandle.hovered ? FluTheme.itemHoverColor : FluTheme.itemNormalColor
        }
        Rectangle{
            width: d.isVertical ? 26 : 4
            height: d.isVertical ? 4 : 26
            anchors.centerIn: parent
            color: control.handleColor
            radius: 2
        }
    }
}

