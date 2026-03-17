import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import FluentUI

TextField{
    signal commit(string text)
    property bool disabled: false
    property int iconSource: 0
    property color normalColor:  FluTheme.textHighlightColor
    property color disableColor:  FluTheme.itemDisableColor
    property color placeholderNormalColor:  FluTheme.placeholderNormalColor
    property color placeholderFocusColor:  FluTheme.placeholderFocusColor
    property color placeholderDisableColor:  FluTheme.itemDisableColor
    id:control
    enabled: !disabled
    color: {
        if(!enabled){
            return disableColor
        }
        return normalColor
    }
    font:FluTextStyle.Body
    padding: 7
    rightPadding: 40
    leftPadding: padding+4
    echoMode:btn_reveal.pressed ? TextField.Normal : TextField.Password
    renderType: FluTheme.nativeText ? Text.NativeRendering : Text.QtRendering
    selectionColor: FluTools.withOpacity(FluTheme.primaryColor,0.5)
    selectedTextColor: color
    placeholderTextColor: {
        if(!enabled){
            return placeholderDisableColor
        }
        if(focus){
            return placeholderFocusColor
        }
        return placeholderNormalColor
    }
    selectByMouse: true
    width: 240
    background: FluTextBoxBackground{
        inputItem: control
    }
    Keys.onEnterPressed: (event)=> d.handleCommit(event)
    Keys.onReturnPressed:(event)=> d.handleCommit(event)
    QtObject{
        id:d
        function handleCommit(event){
            control.commit(control.text)
        }
    }
    FluIconButton{
        id:btn_reveal
        iconSource:FluentIcons.RevealPasswordMedium
        iconSize: 10
        width: 30
        height: 20
        verticalPadding: 0
        horizontalPadding: 0
        iconColor:  FluTheme.iconColor
        visible: control.text !== ""
        anchors{
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: 5
        }
    }
}

