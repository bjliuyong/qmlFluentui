import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import FluentUI

Button {
    property bool disabled: false
    property string contentDescription: ""
    property color normalColor: {
        if(checked){
            return FluTheme.primaryColor
        }else{
            return  FluTheme.normalColor
        }
    }
    property color hoverColor: {
        if(checked){
            return  FluTheme.hoverColor
        }else{
            return  FluTheme.hoverColor
        }
    }
    property color disableColor: {
        if(checked){
            return  FluTheme.disableColor
        }else{
            return  FluTheme.disableColor
        }
    }
    property var clickListener : function(){
        checked = !checked
    }
    property color pressedColor:  FluTheme.pressedColor
    Accessible.role: Accessible.Button
    Accessible.name: control.text
    Accessible.description: contentDescription
    Accessible.onPressAction: control.clicked()
    focusPolicy:Qt.TabFocus
    id: control
    enabled: !disabled
    verticalPadding: 0
    horizontalPadding:12
    onClicked: clickListener()
    background: FluControlBackground{
        implicitWidth: 30
        implicitHeight: 30
        radius: 4
        FluFocusRectangle{
            visible: control.activeFocus
            radius:4
        }
        color:{
            if(!enabled){
                return disableColor
            }
            if(checked){
                if(pressed){
                    return pressedColor
                }
            }
            return hovered ? hoverColor :normalColor
        }
        bottomMargin: {
            if(checked){
                return enabled ? 2 : 0
            }else{
                return 1
            }
        }
        border.width: {
            if(checked){
                return enabled ? 1 : 0
            }else{
                return 1
            }
        }
        shadow: {
            if(checked){
                return true
            }else{
                return !pressed && enabled
            }
        }
        border.color: {
            if(checked){
                return enabled ? Qt.darker(control.normalColor,1.2) : disableColor
            }else{
                return  FluTheme.borderNormalColor
            }
        }
    }
    contentItem: FluText {
        text: control.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: {
            if(checked){
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

