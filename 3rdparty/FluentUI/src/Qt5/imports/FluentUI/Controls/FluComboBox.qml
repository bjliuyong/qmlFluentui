import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import FluentUI 1.0
import QtQuick.Templates 2.15 as T

T.ComboBox {
    id: control
    signal commit(string text)
    property bool disabled: false
    property color normalColor:  FluTheme.normalColor
    property color hoverColor: FluTheme.dark ? Qt.rgba(68/255,68/255,68/255,1) : Qt.rgba(251/255,251/255,251/255,1)
    property color disableColor:  FluTheme.disableColor
    property alias textBox: text_field
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)
    font: FluTextStyle.Body
    leftPadding: padding + (!control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)
    rightPadding: padding + (control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)
    enabled: !disabled
    delegate: FluItemDelegate {
        width: ListView.view.width
        text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
        palette.text: control.palette.text
        font: control.font
        palette.highlightedText: control.palette.highlightedText
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled
    }
    focusPolicy:Qt.TabFocus
    indicator: FluIcon {
        x: control.mirrored ? control.padding : control.width - width - control.padding
        y: control.topPadding + (control.availableHeight - height) / 2
        width: 28
        iconSource:FluentIcons.ChevronDown
        iconSize: 15
        opacity: enabled ? 1 : 0.3
    }
    contentItem: T.TextField {
        id: text_field
        property bool disabled: !control.editable
        leftPadding: !control.mirrored ? 10 : control.editable && activeFocus ? 3 : 1
        rightPadding: control.mirrored ? 10 : control.editable && activeFocus ? 3 : 1
        topPadding: 6 - control.padding
        bottomPadding: 6 - control.padding
        renderType: FluTheme.nativeText ? Text.NativeRendering : Text.QtRendering
        selectionColor: FluTools.withOpacity(FluTheme.primaryColor,0.5)
        selectedTextColor: color
        text: control.editable ? control.editText : control.displayText
        enabled: control.editable
        autoScroll: control.editable
        font:control.font
        readOnly: control.down
        color: {
            if(!control.enabled) {
                return  FluTheme.itemDisableColor
            }
            return  FluTheme.textHighlightColor
        }
        inputMethodHints: control.inputMethodHints
        validator: control.validator
        selectByMouse: true
        verticalAlignment: Text.AlignVCenter
        background: FluTextBoxBackground{
            border.width: 1
            bottomMargin: {
                if(!control.editable){
                    return 1
                }
                return contentItem && contentItem.activeFocus ? 2 : 1
            }
            inputItem: contentItem
        }
        Component.onCompleted: {
            forceActiveFocus()
        }
        Keys.onEnterPressed: (event)=> handleCommit(event)
        Keys.onReturnPressed:(event)=> handleCommit(event)
        function handleCommit(event){
            control.commit(control.editText)
            accepted()
        }
    }
    background: Rectangle {
        implicitWidth: 140
        implicitHeight: 32
        border.color:  FluTheme.borderNormalColor
        border.width: 1
        visible: !control.flat || control.down
        radius: 4
        FluFocusRectangle{
            visible: control.visualFocus
            radius:4
            anchors.margins: -2
        }
        color:{
            if(!enabled){
                return disableColor
            }
            return hovered ? hoverColor :normalColor
        }
    }
    popup: T.Popup {
        y: control.height
        width: control.width
        height: Math.min(contentItem.implicitHeight, control.Window.height - topMargin - bottomMargin)
        topMargin: 32
        bottomMargin: 6
        modal: true
        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.delegateModel
            currentIndex: control.highlightedIndex
            highlightMoveDuration: 0
            boundsMovement: Flickable.StopAtBounds
            T.ScrollIndicator.vertical: ScrollIndicator { }
        }
        enter: Transition {
            NumberAnimation {
                property: "opacity"
                from:0
                to:1
                duration: FluTheme.animationEnabled ? 83 : 0
            }
        }
        exit:Transition {
            NumberAnimation {
                property: "opacity"
                from:1
                to:0
                duration: FluTheme.animationEnabled ? 83 : 0
            }
        }
        background:Rectangle{
            radius: 5
            color:  FluTheme.windowActiveBackgroundColor
            border.color:  FluTheme.borderNormalColor
            FluShadow{
                radius: 5
            }
        }
    }
}

