import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Effects
import FluentUI


Item {
    id: control



    property alias title: group.title              // 标题属性别名
    default property alias content: slot.data      // 默认内容属性别名
    property real weight: 10                       // 权重属性，默认10


    Layout.fillWidth: true                         // 布局填充宽度
    Layout.fillHeight: true                        // 布局填充高度


    // 1. 阴影层：放在最下面 (z: 0)
    // 可选：如果内容完全不透明，可以让 MultiEffect 只绘制阴影不绘制内容，节省性能
    // 但通常保持默认即可，因为它在下面，被内容盖住也没事
    MultiEffect {
        source: group                              // 阴影源为group
        anchors.fill: group                        // 锚定填充group
        z: 0                                       // 层级在最底层
        // 关键配置：
        shadowEnabled: true                        // 启用阴影
        shadowColor: FluColors.Grey80              // 阴影颜色
        shadowBlur: 0.8                            // 阴影模糊度
        shadowVerticalOffset: 3                    // 阴影垂直偏移
    }

    // 2. 内容层：放在上面 (z: 1)
    FluGroupBox {
        id: group                                  // 组框ID
        z: 1                                       // 层级在上层
        anchors.fill: parent                       // 锚定填充父对象
        padding: 0                                 // 内边距为0
        // background: null                           // 背景为空
        // Rectangle {
        //     id: slot                               // 插槽矩形ID
        //     radius: 4                              // 圆角半径
        //     color:  Window.active ? FluTheme.windowActiveBackgroundColor : FluTheme.windowBackgroundColor
        //     anchors.fill: parent                   // 锚定填充父对象
        // }
		color: Window.active ? FluTheme.headerNormalColor : FluTheme.headerNormalColor
		Item{
			id: slot
			anchors.fill: parent
		}
    }
}


// FluGroupBox{
// 	id: control
// 	default property alias content: control.data
// 	property real weight: 20
// 	Layout.fillWidth: true
// 	Layout.fillHeight: true
//
// 	color: Window.active ? FluTheme.windowActiveBackgroundColor : FluTheme.windowBackgroundColor
//
// 	layer.enabled: true
// 	layer.effect:MultiEffect{
// 		shadowEnabled: true
// 		shadowColor: FluTheme.drak? "#60000000":"#28000000"
// 		shadowBlur:0.5
// 		shadowVerticalOffset:2
// 		shadowHorizontalOffset: 0
//
// 	}
// }