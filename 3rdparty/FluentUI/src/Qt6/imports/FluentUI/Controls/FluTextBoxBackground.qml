import QtQuick
import QtQuick.Controls
import FluentUI

FluControlBackground{
    property Item inputItem
    id:control
    color: {
        if(inputItem && !inputItem.enabled){
            return  FluTheme.disableColor
        }
        var isReadOnly = inputItem && inputItem.hasOwnProperty("readOnly") && inputItem.readOnly
        if(!isReadOnly && inputItem && inputItem.activeFocus){
            return FluTheme.pressedColor
        }
        if(!isReadOnly && inputItem && inputItem.hovered){
            return FluTheme.hoverColor
        }
        return FluTheme.normalColor
    }
    border.width: 1
    gradient: Gradient {
        GradientStop { position: 0.0; color: d.startColor }
        GradientStop { position: 1 - d.offsetSize/control.height; color: d.startColor }
        GradientStop { position: 1.0; color: d.endColor }
    }
    bottomMargin: 1
    QtObject{
        id:d
        property int offsetSize :  3
        property color startColor :  FluTheme.startColor
        property color endColor: {
            if(!control.enabled){
                return d.startColor
            }
            return  FluTheme.borderNormalColor
        }
    }
    FluClip{
        anchors.fill: parent
        radius: [control.radius,control.radius,control.radius,control.radius]
        visible: inputItem && (!inputItem.hasOwnProperty("readOnly") || !inputItem.readOnly) && inputItem.activeFocus
        Rectangle{
            width: parent.width
            height: 2
            anchors.bottom: parent.bottom
            color: FluTheme.primaryColor
        }
    }
}

