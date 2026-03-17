import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import FluentUI 1.0

Button {
    property bool disabled: false
    property string contentDescription: ""
    property color disableColor:  FluTheme.disableColor
    property color checkColor: FluTheme.primaryColor
    property color hoverColor:  FluTheme.hoverColor
    property color normalColor:  FluTheme.normalColor
    property color borderNormalColor:  FluTheme.borderNormalColor
    property color borderCheckColor: FluTheme.primaryColor
    property color borderDisableColor:  FluTheme.borderDisableColor
    property color dotNormalColor:  FluTheme.dotNormalColor
    property color dotCheckColor:  FluTheme.dotCheckColor
    property color dotDisableColor:  FluTheme.dotDisableColor
    property real textSpacing: 6
    property bool textRight: true
    property color textColor: {
        if(FluTheme.dark){
            if(!enabled){
                return Qt.rgba(130/255,130/255,130/255,1)
            }
            return Qt.rgba(1,1,1,1)
        }else{
            if(!enabled){
                return Qt.rgba(161/255,161/255,161/255,1)
            }
            return Qt.rgba(0,0,0,1)
        }
    }
    property var clickListener : function(){
        checked = !checked
    }
    id: control
    Accessible.role: Accessible.Button
    Accessible.name: control.text
    Accessible.description: contentDescription
    Accessible.onPressAction: control.clicked()
    enabled: !disabled
    focusPolicy:Qt.TabFocus
    onClicked: clickListener()
    padding: 0
    horizontalPadding: 0
    onCheckableChanged: {
        if(checkable){
            checkable = false
        }
    }
    background : Item{
        implicitHeight: 20
        implicitWidth: 40
    }
    contentItem: RowLayout{
        spacing: control.textSpacing
        layoutDirection:control.textRight ? Qt.LeftToRight : Qt.RightToLeft
        Rectangle {
            id:control_backgound
            implicitWidth: background.implicitWidth
            implicitHeight: background.implicitHeight
            radius: height / 2
            FluFocusRectangle{
                visible: control.activeFocus
                radius: parent.radius
            }
            color: {
                if(!enabled){
                    return disableColor
                }
                if(checked){
                    return checkColor
                }
                if(hovered){
                    return hoverColor
                }
                return normalColor
            }
            border.width: 1
            border.color: {
                if(!enabled){
                    return borderDisableColor
                }
                if(checked){
                    return borderCheckColor
                }
                return borderNormalColor
            }
            FluIcon {
                width:  parent.height
                x:checked ? control_backgound.width-width : 0
                scale: {
                    if(pressed){
                        return 5/10
                    }
                    return hovered&enabled ? 7/10 : 6/10
                }
                iconSource: FluentIcons.FullCircleMask
                iconSize: 20
                color: {
                    if(!enabled){
                        return dotDisableColor
                    }
                    if(checked){
                        return dotCheckColor
                    }
                    return dotNormalColor
                }
                Behavior on scale{
                    NumberAnimation{
                        duration: 167
                        easing.type: Easing.OutCubic
                    }
                }
                Behavior on x  {
                    enabled: FluTheme.animationEnabled
                    NumberAnimation {
                        duration: 167
                        easing.type: Easing.OutCubic
                    }
                }
            }
        }
        FluText{
            id:btn_text
            text: control.text
            Layout.alignment: Qt.AlignVCenter
            visible: text !== ""
            color: control.textColor
        }
    }
}

