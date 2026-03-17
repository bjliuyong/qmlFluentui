import QtQuick 2.15
import QtQuick.Controls 2.15
import FluentUI 1.0

Button {
    property bool disabled: false
    property string contentDescription: ""
    property color normalColor: FluTheme.primaryColor
    property color hoverColor:  FluTheme.hoverColor
    property color pressedColor:  FluTheme.pressedColor
    property color disableColor:  FluTheme.disableColor
    property color backgroundHoverColor: FluTheme.itemHoverColor
    property color backgroundPressedColor: FluTheme.itemPressColor
    property color backgroundNormalColor: FluTheme.itemNormalColor
    property color backgroundDisableColor: FluTheme.itemNormalColor
    property bool textBold: true
    property color textColor: {
        if(!enabled){
            return disableColor
        }
        if(pressed){
            return pressedColor
        }
        return hovered ? hoverColor :normalColor
    }
    id: control
    horizontalPadding:6
    enabled: !disabled
    font:FluTextStyle.Body
    background: Rectangle{
        implicitWidth: 30
        implicitHeight: 30
        radius: 4
        color: {
            if(!enabled){
                return backgroundDisableColor
            }
            if(pressed){
                return backgroundPressedColor
            }
            if(hovered){
                return backgroundHoverColor
            }
            return backgroundNormalColor
        }
        FluFocusRectangle{
            visible: control.visualFocus
            radius:8
        }
    }
    focusPolicy:Qt.TabFocus
    Accessible.role: Accessible.Button
    Accessible.name: control.text
    Accessible.description: contentDescription
    Accessible.onPressAction: control.clicked()
    contentItem: FluText {
        id:btn_text
        text: control.text
        font: control.font
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: control.textColor
    }
}

