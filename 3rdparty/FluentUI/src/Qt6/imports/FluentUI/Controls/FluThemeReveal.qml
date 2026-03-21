import QtQuick
import FluentUI

Item {
    id: control
    z: 65535

    property bool isAnimating: false
    property var target: parent

    // 【新增】：用于记录全局动画的初始状态，以便动画结束后恢复
    property bool _animPrevState: true

    function start(button, callback) {
        if (isAnimating) return
        if (!target) return

        var targetGlobalPos = target.mapToItem(null, 0, 0)
        var myParentPos = parent.mapToItem(null, 0, 0)

        control.x = targetGlobalPos.x - myParentPos.x
        control.y = targetGlobalPos.y - myParentPos.y
        control.width = target.width
        control.height = target.height

        isAnimating = true
        var pos = button.mapToItem(control, 0, 0)

        var mX = Math.round(pos.x + button.width / 2)
        var mY = Math.round(pos.y + button.height / 2)

        var rad = Math.round(Math.max(
            distance(mX, mY, 0, 0),
            distance(mX, mY, control.width, 0),
            distance(mX, mY, 0, control.height),
            distance(mX, mY, control.width, control.height)
        ))

        loader_reveal.sourceComponent = com_reveal
        var item = loader_reveal.item
        if (item) {
            item.mouseX = mX
            item.mouseY = mY
            item.radiusValue = rad
            item.callback = callback
            item.darkToLight = FluTheme.dark
            item.startReveal()
        }
    }

    function distance(x1, y1, x2, y2) {
        return Math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
    }

    Loader {
        id: loader_reveal
        anchors.fill: parent
    }

    Component {
        id: com_reveal
        CircularReveal {
            id: reveal
            property int mouseX
            property int mouseY
            property int radiusValue
            property var callback
            target: control.target
            anchors.fill: parent

            function startReveal() {
                var w = Math.round(width * Screen.devicePixelRatio)
                var h = Math.round(height * Screen.devicePixelRatio)
                reveal.start(w, h, Qt.point(mouseX, mouseY), radiusValue)
            }

            onAnimationFinished: {
                loader_reveal.sourceComponent = undefined
                control.isAnimating = false

                // 【修复 3】：遮罩动画全部播放完毕后，恢复系统原本的渐变动画开关
                FluTheme.animationEnabled = control._animPrevState
            }

            onImageChanged: {
                // 【修复 1】：截图完成，但不立刻切换主题，启动延时器等待渲染上屏
                delayTimer.start()
            }

            // 【核心修复器】：处理渲染延迟和底层多重动画冲突
            Timer {
                id: delayTimer
                interval: 50 // 延时 50ms（大约3帧），确保遮罩已经严密地盖在了屏幕上
                onTriggered: {
                    // 【修复 2.1】：保存当前动画开关状态，然后强制关闭！
                    // 这样底层的主题颜色就会瞬间切换（没有任何渐变过程）
                    control._animPrevState = FluTheme.animationEnabled
                    FluTheme.animationEnabled = false

                    // 【修复 2.2】：此时切换主题，被遮罩挡住的真实UI会瞬间完成色值替换
                    if (reveal.callback) reveal.callback()
                }
            }
        }
    }
}