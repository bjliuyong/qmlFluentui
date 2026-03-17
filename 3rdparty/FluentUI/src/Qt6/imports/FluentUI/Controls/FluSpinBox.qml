import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import FluentUI

T.SpinBox {
    id: control
    property bool disabled: false
    property color normalColor:  FluTheme.normalColor
    property color hoverColor:  FluTheme.hoverColor
    property color pressedColor:  FluTheme.pressedColor
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             up.implicitIndicatorHeight, down.implicitIndicatorHeight)
    leftPadding: padding + (control.mirrored ? (up.indicator ? up.indicator.width : 0) : (down.indicator ? down.indicator.width : 0))
    rightPadding: padding + (control.mirrored ? (down.indicator ? down.indicator.width : 0) : (up.indicator ? up.indicator.width : 0))
    enabled: !disabled
    validator: IntValidator {
        locale: control.locale.name
        bottom: Math.min(control.from, control.to)
        top: Math.max(control.from, control.to)
    }
    font: FluTextStyle.Body

    contentItem: TextInput {
        property color normalColor:  FluTheme.textHighlightColor
        property color disableColor:  FluTheme.itemDisableColor
        property color placeholderNormalColor:  FluTheme.placeholderNormalColor
        property color placeholderFocusColor:  FluTheme.placeholderFocusColor
        property color placeholderDisableColor:  FluTheme.itemDisableColor
        z: 2
        text: control.displayText
        clip: width < implicitWidth
        padding: 6
        font: control.font
        color: {
            if(!enabled){
                return disableColor
            }
            return normalColor
        }
        selectionColor: FluTools.withOpacity(FluTheme.primaryColor,0.5)
        selectedTextColor: color
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
        readOnly: !control.editable
        validator: control.validator
        inputMethodHints: control.inputMethodHints

    }

    up.indicator: FluClip {
        x: control.mirrored ? 1 : control.width - width - 1
        y: 1
        height: control.height - 2
        implicitWidth: 32
        implicitHeight: 32
        radius: [0,3,3,0]
        Rectangle{
            anchors.fill: parent
            color: {
                if(control.up.pressed){
                    return control.pressedColor
                }
                if(control.up.hovered){
                    return control.hoverColor
                }
                return control.normalColor
            }
        }
        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: parent.width / 3
            height: 2
            color: enabled ?  FluTheme.textHighlightColor : FluColors.Grey90
        }
        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: 2
            height: parent.width / 3
            color: enabled ?  FluTheme.textHighlightColor : FluColors.Grey90
        }
    }


    down.indicator: FluClip {
        x: control.mirrored ? control.width - width - 1 : 1
        y: 1
        height: control.height - 2
        implicitWidth: 32
        implicitHeight: 32
        radius: [3,0,0,3]
        Rectangle{
            anchors.fill: parent
            color: {
                if(control.down.pressed){
                    return control.pressedColor
                }
                if(control.down.hovered){
                    return control.hoverColor
                }
                return normalColor
            }
        }
        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: parent.width / 3
            height: 2
            color: enabled ?  FluTheme.textHighlightColor : FluColors.Grey90
        }
    }

    background: Rectangle {
        implicitWidth: 136
        radius: 4
        border.width: 1
        border.color: {
            if(!contentItem.enabled){
                return FluTheme.borderDisableColor
            }
            return FluTheme.borderNormalColor
        }
        color: {
            if(!contentItem.enabled){
                return  FluTheme.disableColor
            }
            if(contentItem.activeFocus){
                return FluTheme.pressedColor
            }
            if(contentItem.hovered){
                return FluTheme.hoverColor
            }
            return FluTheme.normalColor
        }
    }
}

