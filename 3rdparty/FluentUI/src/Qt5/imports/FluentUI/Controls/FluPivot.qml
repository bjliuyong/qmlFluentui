import QtQuick 2.15
import QtQuick.Controls 2.15
import FluentUI 1.0

Page {
    default property alias content: d.children
    property alias currentIndex: nav_list.currentIndex
    property color textHighlightColor: FluTheme.dark ? FluColors.Grey10 : FluColors.Black
    property color textNormalColor: FluTheme.dark ? FluColors.Grey120 : FluColors.Grey120
    property color textHoverColor: FluTheme.dark ? FluColors.Grey80 : FluColors.Grey150
    property int textSpacing: 10
    property int headerSpacing: 20
    property int headerHeight: 40
    id:control
    width: 400
    height: 300
    font: FluTextStyle.Title
    implicitHeight: height
    implicitWidth: width
    FluObject{
        id:d
        property int tabY: control.headerHeight/2+control.font.pixelSize/2 + 3
    }
    background:Item{}
    header:ListView{
        id:nav_list
        implicitHeight: control.headerHeight
        implicitWidth: control.width
        model:d.children
        spacing: control.headerSpacing
        interactive: false
        orientation: ListView.Horizontal
        highlightMoveDuration: FluTheme.animationEnabled ? 167 : 0
        highlightResizeDuration: FluTheme.animationEnabled ? 167 : 0
        highlight: Item{
            clip: true
            Rectangle{
                height: 3
                radius: 1.5
                color: FluTheme.primaryColor
                width: nav_list.currentItem.width
                y:d.tabY
            }
        }
        delegate: Button{
            id:item_button
            width: item_title.width
            height: nav_list.height
            focusPolicy:Qt.TabFocus
            background:Item{
                FluFocusRectangle{
                    anchors.margins: -4
                    visible: item_button.activeFocus
                    radius:4
                }
            }
            contentItem: Item{
                FluText {
                    id:item_title
                    text: modelData.title
                    anchors.centerIn: parent
                    font: control.font
                    color: {
                        if(nav_list.currentIndex === index) {
                            return textHighlightColor;
                        }
                        if (item_button.hovered) {
                            return textHoverColor;
                        } 
                        return textNormalColor;
                    }
                }
            }
            onClicked: {
                nav_list.currentIndex = index
            }
        }
    }
    Item{
        id:container
        anchors.fill: parent

        clip: true

        property real offsetIndex: nav_list.currentIndex
        Behavior on offsetIndex {
            enabled: FluTheme.animationEnabled
            NumberAnimation {
                duration: 350
                easing.type: Easing.OutCubic
            }
        }

        Repeater{
            model:d.children
            FluLoader{
                property var argument: modelData.argument
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: parent.width

                sourceComponent: modelData.contentItem

                x: (index - container.offsetIndex) * width

                visible: Math.abs(index - container.offsetIndex) < 0.999 || index === nav_list.currentIndex
            }
        }
    }
}
