import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
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
    property bool cleanEnabled: true
    property bool shadow: true
    id:control
    padding: 7
    leftPadding: padding+4
    enabled: !disabled
    color: {
        if(!enabled){
            return disableColor
        }
        return normalColor
    }
    font:FluTextStyle.Body
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
    rightPadding: {
        var w = 30
        if(control.cleanEnabled === false){
            w = 0
        }
        if(control.readOnly)
            w = 0
        return icon_end.visible ? w+36 : w+10
    }
    width: 240
    background: FluTextBoxBackground{
        inputItem: control
        shadow: control.shadow
    }
    Keys.onEnterPressed: (event)=> d.handleCommit(event)
    Keys.onReturnPressed:(event)=> d.handleCommit(event)
    QtObject{
        id:d
        function handleCommit(event){
            control.commit(control.text)
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
    RowLayout{
        height: parent.height
        anchors{
            right: parent.right
            rightMargin: 5
        }
        spacing: 4
        FluIconButton{
            iconSource: FluentIcons.Cancel
            iconSize: 12
            Layout.preferredWidth: 30
            Layout.preferredHeight: 20
            Layout.alignment: Qt.AlignVCenter
            iconColor:  FluTheme.iconColor
            verticalPadding: 0
            horizontalPadding: 0
            visible: {
                if(control.cleanEnabled === false){
                    return false
                }
                if(control.readOnly)
                    return false
                return control.text !== ""
            }
            contentDescription:"Clean"
            onClicked:{
                control.clear()
            }
        }
        FluIcon{
            id:icon_end
            iconSource: control.iconSource
            iconSize: 12
            Layout.alignment: Qt.AlignVCenter
            Layout.rightMargin: 7
            iconColor:  FluTheme.iconColor
            visible: control.iconSource != 0
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

