import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import FluentUI

T.MenuBarItem {
    property bool disabled: false
    property color textColor: {
        if(!enabled){
            return FluTheme.textDisableColor
        }
        if(pressed){
            return FluTheme.textHoverColor
        }
        return FluTheme.textHighlightColor
    }
    id: control
    enabled: !disabled
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)
    spacing: 6
    padding: 6
    leftPadding: 12
    rightPadding: 16
    icon.width: 24
    icon.height: 24
    icon.color: control.palette.buttonText
    contentItem: FluText {
        verticalAlignment: Text.AlignVCenter
        text: control.text
        color:control.textColor
    }
    background: Rectangle {
        implicitWidth: 30
        implicitHeight: 30
        radius: 3
        color: {
            if(control.highlighted){
                return FluTheme.itemHoverColor
            }
            return FluTheme.itemNormalColor
        }
    }
}

