import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import FluentUI


Button {
    property bool disabled: false
    property string contentDescription: ""
    property color normalColor:  FluTheme.normalColor
    property color hoverColor:  FluTheme.hoverColor
    property color disableColor:  FluTheme.disableColor
    property color dividerColor:  FluTheme.dividerColor
    property color textColor: {
        if(!enabled){
            return FluTheme.textDisableColor
        }
        if(pressed){
            return FluTheme.textNormalColor
        }
        return FluTheme.textHighlightColor
    }
    Accessible.role: Accessible.Button
    Accessible.name: control.text
    Accessible.description: contentDescription
    Accessible.onPressAction: control.clicked()
    id: control
    enabled: !disabled
    verticalPadding: 0
    horizontalPadding:12
    font:FluTextStyle.Body
    focusPolicy:Qt.TabFocus
    background: FluControlBackground{
        implicitWidth: 30
        implicitHeight: 30
        radius: 4
        color: {
            if(!enabled){
                return disableColor
            }
            return hovered ? hoverColor :normalColor
        }
        shadow: !pressed && enabled
        FluFocusRectangle{
            visible: control.activeFocus
            radius:4
        }
    }
    contentItem: FluText {
        text: control.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font: control.font
        color: control.textColor
    }
}

