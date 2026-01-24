// import QtQuick
// import QtQuick.Layouts
// import QtQuick.Controls
// import QtQuick.Effects
// import FluentUI

// Item {
//     id: control
//     property alias title: group.title
//     default property alias content: slot.data // 指向 data 属性，支持插入多个组件

//     property real weight: 10

//     Layout.fillWidth: true
//     Layout.fillHeight: true
//     // 高度由外部 Layout 根据权重分配

//     FluGroupBox {
//         id: group
//         anchors.fill: parent
//         padding: 0
//         Item {
//             id: slot
//             anchors.fill: parent
//         }
//     }

//     MultiEffect {
//         source: group
//         anchors.fill: group
//         shadowEnabled: true
//         shadowColor: FluColors.Grey50
//         shadowBlur: 0.6
//         shadowVerticalOffset: 3
//     }
// }
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Effects
import FluentUI

Item {
    id: control
    property alias title: group.title
    default property alias content: slot.data

    property real weight: 10

    Layout.fillWidth: true
    Layout.fillHeight: true

    // 1. 阴影层：放在最下面 (z: 0)
    MultiEffect {
        source: group
        anchors.fill: group
        z: 0

        // 关键配置：
        shadowEnabled: true
        shadowColor: FluColors.Grey80 // 稍微加深一点颜色以便观察
        shadowBlur: 0.8               // 稍微增加模糊度
        shadowVerticalOffset: 3

        // 可选：如果内容完全不透明，可以让 MultiEffect 只绘制阴影不绘制内容，节省性能
        // 但通常保持默认即可，因为它在下面，被内容盖住也没事
    }

    // 2. 内容层：放在上面 (z: 1)
    FluGroupBox {
        id: group
        z: 1  // 确保内容永远压在阴影上面
        anchors.fill: parent
        padding: 0

        background: null
        Rectangle {
            id: slot
            radius: 4
            color:  FluColors.Grey10
            anchors.fill: parent

        }
    }
}
