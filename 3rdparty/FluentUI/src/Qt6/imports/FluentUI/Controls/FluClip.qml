import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import FluentUI

FluRectangle {
    id:control
    color: "#00000000"
    layer.enabled: !FluTools.isSoftware()
    layer.textureSize: Qt.size(control.width*2*Math.ceil(Screen.devicePixelRatio),control.height*2*Math.ceil(Screen.devicePixelRatio))
    layer.effect: OpacityMask{
        maskSource: ShaderEffectSource{
            sourceItem: FluRectangle{
                radius: control.radius
                width: control.width
                height: control.height
            }
        }
    }
}
// import QtQuick
// import QtQuick.Controls
// import FluentUI

// FluRectangle {
//     id: control
//     color: "#00000000"

//     layer.enabled: !FluTools.isSoftware()
//     layer.textureSize: Qt.size(
//         control.width * 2 * Math.ceil(Screen.devicePixelRatio),
//         control.height * 2 * Math.ceil(Screen.devicePixelRatio)
//     )

//     layer.effect: ShaderEffect {
//         property real radius: control.radius
//         property size size: Qt.size(control.width, control.height)

//         fragmentShader: "
//             uniform float radius;
//             uniform vec2 size;
//             varying vec2 qt_TexCoord0;

//             float roundedRect(vec2 p, vec2 b, float r) {
//                 vec2 q = abs(p - b * 0.5) - b * 0.5 + r;
//                 return length(max(q, 0.0)) - r;
//             }

//             void main() {
//                 float d = roundedRect(
//                     qt_TexCoord0 * size,
//                     size,
//                     radius
//                 );

//                 float alpha = smoothstep(1.0, 0.0, d);
//                 gl_FragColor = vec4(1.0, 1.0, 1.0, alpha);
//             }
//         "
//     }
// }
