import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import FluentUI

FluButton {
    property real progress
    QtObject{
        id:d
        property bool checked: (Number(rect_back.height) === Number(background.height)) && (progress === 1)
    }
    id: control
    property color normalColor: {
        if(d.checked){
            return FluTheme.primaryColor
        }else{
            return  FluTheme.normalColor
        }
    }
    property color hoverColor: {
        if(d.checked){
            return  FluTheme.hoverColor
        }else{
            return  FluTheme.hoverColor
        }
    }
    property color disableColor: {
        if(d.checked){
            return  FluTheme.disableColor
        }else{
            return FluTheme.normalColor
        }
    }
    property color pressedColor:  FluTheme.pressedColor
    background: FluControlBackground{
        implicitWidth: 30
        implicitHeight: 30
        radius: 4
        border.color:  FluTheme.borderNormalColor
        border.width: d.checked ? 0 : 1
        color:{
            if(!enabled){
                return disableColor
            }
            if(d.checked){
                if(pressed){
                    return pressedColor
                }
            }
            return hovered ? hoverColor :normalColor
        }
        FluClip{
            anchors.fill: parent
            radius: [4,4,4,4]
            Rectangle{
                id:rect_back
                width: parent.width  * control.progress
                height: control.progress === 1 ? background.height : 3
                visible: !d.checked
                color: FluTheme.primaryColor
                anchors.bottom: parent.bottom
                Behavior on height{
                    enabled: control.progress !== 0
                    SequentialAnimation {
                        PauseAnimation {
                            duration: FluTheme.animationEnabled ? 167 : 0
                        }
                        NumberAnimation{
                            duration: FluTheme.animationEnabled ? 167 : 0
                            from: 3
                            to: background.height
                        }
                    }
                }
                Behavior on width{
                    NumberAnimation{
                        duration: 167
                    }
                }
            }
        }
        FluFocusRectangle{
            visible: control.activeFocus
            radius:4
        }
    }
    contentItem: FluText {
        text: control.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: {
            if(d.checked){
                if(!enabled){
                    return FluTheme.disableColor
                }
                return FluTheme.strokeColor
            }else{
                if(!enabled){
                    return FluTheme.textDisableColor
                }
                if(pressed){
                    return FluTheme.textNormalColor
                }
                return FluTheme.textHighlightColor
            }
        }
    }
}

