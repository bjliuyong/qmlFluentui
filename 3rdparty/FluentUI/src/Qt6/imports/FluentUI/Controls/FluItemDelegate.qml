import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Templates as T
import FluentUI

T.ItemDelegate {
    id: control
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)
    padding: 0
    verticalPadding: 8
    horizontalPadding: 10
    icon.color: control.palette.text
    contentItem:FluText {
        text: control.text
        font: control.font
        color:{
            if(control.down){
                return FluTheme.textNormalColor
            }
            return FluTheme.textHighlightColor
        }
    }
    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 30
        color: FluTheme.itemHoverColor
        visible: control.down || control.highlighted || control.visualFocus
    }
}
