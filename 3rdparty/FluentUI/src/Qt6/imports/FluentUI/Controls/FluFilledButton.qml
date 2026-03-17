import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import FluentUI

Button {
    property bool disabled: false
    property string contentDescription: ""
    property color normalColor: FluTheme.checkColor
    property color hoverColor:  FluTheme.hoverColor
    property color disableColor:  FluTheme.disableColor
    property color pressedColor:  FluTheme.pressedColor
    property color textColor: !enabled ? FluTheme.itemDisableColor : FluTheme.strokeColor
    Accessible.role: Accessible.Button
    Accessible.name: control.text
    Accessible.description: contentDescription
    Accessible.onPressAction: control.clicked()
    id: control
    enabled: !disabled
    focusPolicy:Qt.TabFocus
    font:FluTextStyle.Body
    verticalPadding: 0
    horizontalPadding:12
    background: FluControlBackground{
        implicitWidth: 30
        implicitHeight: 30
        radius: 4
        bottomMargin: enabled ? 2 : 0
        border.width: enabled ? 1 : 0
        border.color: enabled ? Qt.darker(control.normalColor,1.2) : disableColor
        color:{
            if(!enabled){
                return disableColor
            }
            if(pressed){
                return pressedColor
            }
            return hovered ? hoverColor :normalColor
        }
        FluFocusRectangle{
            visible: control.visualFocus
            radius:4
        }
    }
    contentItem: FluText {
        text: control.text
        font: control.font
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: control.textColor
    }
}

