import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import FluentUI

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
        Repeater{
            model:d.children
            FluLoader {
                property var argument: modelData.argument
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: parent.width

                sourceComponent: modelData.contentItem

                // 【关键 3】：真正的物理排列！根据索引差值，将所有页面排成一长条
                // 比如当前是 1，那么索引 0 的 x 就是 -width，索引 2 的 x 就是 width
                x: (index - nav_list.currentIndex) * width

                // 【关键 4】：纯净的物理滑动动画
                Behavior on x {
                    NumberAnimation {
                        duration: 350 // 350ms 是最舒服的滑动速度
                        easing.type: Easing.OutCubic
                    }
                }

                // 【关键 5】：杜绝闪屏！永远保持 true，让 QML 动画引擎绝不中断
                visible: true
            }
        }
    }
}
