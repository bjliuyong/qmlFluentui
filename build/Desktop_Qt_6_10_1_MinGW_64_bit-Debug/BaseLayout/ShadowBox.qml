import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Effects
import FluentUI
Item {
    id: control
    property alias title: group.title
    property alias content: slot.data // 指向 data 属性，支持插入多个组件

    property real weight: 10

    Layout.fillWidth: true
    Layout.fillHeight: true
    // 高度由外部 Layout 根据权重分配

    Component.onCompleted: {
        console.log("测试颜色值:", FluColors.Grey210)
    }
    FluGroupBox {
        id: group
        anchors.fill: parent

        Item {
            id: slot
            anchors.fill: parent
        }
    }

    MultiEffect {
        source: group
        anchors.fill: group
        shadowEnabled: true
        shadowColor: FluColors.Grey50
        shadowBlur: 0.6
        shadowVerticalOffset: 3
    }
}
