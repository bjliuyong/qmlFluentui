import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import FluentUI

Popup {
    id: control
    padding: 0
    modal:true
    property int xOffset: 0
    property int yOffset: 0
    parent: Overlay.overlay
    x: Math.round((d.parentWidth - width) / 2) + xOffset
    y: Math.round((d.parentHeight - height) / 2) + yOffset
    closePolicy: Popup.NoAutoClose
    enter: Transition {
        ParallelAnimation {
            NumberAnimation {
                property: "opacity"
                duration: FluTheme.animationEnabled ? 300 : 0
                from: 0
                to: 1
            }
            NumberAnimation {
                property: "scale"
                duration: FluTheme.animationEnabled ? 300 : 0
                from: 0.8
                to: 1
                easing.type: Easing.OutCubic
            }
        }
    }
    height:Math.min(implicitHeight,d.parentHeight)
    exit:Transition {
        ParallelAnimation {
            NumberAnimation {
                property: "opacity"
                duration: FluTheme.animationEnabled ? 300 : 0
                from: 1
                to: 0
            }
            NumberAnimation {
                property: "scale"
                duration: FluTheme.animationEnabled ? 300 : 0
                from: 1
                to: 0.8
                easing.type: Easing.InCubic
            }
        }
    }
    background: FluRectangle{
        radius: [5,5,5,5]
        color:  FluTheme.windowActiveBackgroundColor
        borderWidth: 1
        borderColor: FluTheme.dark ? Qt.rgba(255,255,255,0.08) : Qt.rgba(0,0,0,0.08)
        FluShadow{
            radius: 8
            elevation: 10
        }
    }
    QtObject{
        id:d
        property int parentHeight: {
            if(control.parent){
                return control.parent.height
            }
            return control.height
        }
        property int parentWidth: {
            if(control.parent){
                return control.parent.width
            }
            return control.width
        }
    }
}

