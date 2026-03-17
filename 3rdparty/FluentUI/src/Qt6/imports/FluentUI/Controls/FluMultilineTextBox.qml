import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import FluentUI

TextArea{
    signal commit(string text)
    property bool disabled: false
    property color normalColor:  FluTheme.textHighlightColor
    property color disableColor:  FluTheme.itemDisableColor
    property color placeholderNormalColor:  FluTheme.placeholderNormalColor
    property color placeholderFocusColor:  FluTheme.placeholderFocusColor
    property color placeholderDisableColor:  FluTheme.itemDisableColor
    property bool isCtrlEnterForNewline: false
    id:control
    enabled: !disabled
    color: {
        if(!enabled){
            return disableColor
        }
        return normalColor
    }
    font:FluTextStyle.Body
    wrapMode: Text.WordWrap
    padding: 8
    leftPadding: padding+4
    renderType: FluTheme.nativeText ? Text.NativeRendering : Text.QtRendering
    selectedTextColor: color
    selectionColor: FluTools.withOpacity(FluTheme.primaryColor,0.5)
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
            if(isCtrlEnterForNewline){
                if(event.modifiers & Qt.ControlModifier){
                    insert(control.cursorPosition, "\n")
                    return
                }
                control.commit(control.text)
            }else{
                if(event.modifiers & Qt.ControlModifier){
                    control.commit(control.text)
                    return
                }
                insert(control.cursorPosition, "\n")
            }
        }
    }
    MouseArea{
        anchors.fill: parent
        cursorShape: Qt.IBeamCursor
        acceptedButtons: Qt.RightButton
        onClicked: {
            if(control.echoMode === TextInput.Password){
                return
            }
            if(control.readOnly && control.text === ""){
                return
            }
            menu_loader.popup()
        }
    }
    FluLoader{
        id: menu_loader
        function popup(){
            sourceComponent = menu
        }
    }
    Component{
        id:menu
        FluTextBoxMenu{
            inputItem: control
            Component.onCompleted: {
                popup()
            }
            onClosed: {
                menu_loader.sourceComponent = undefined
            }
        }
    }
}

