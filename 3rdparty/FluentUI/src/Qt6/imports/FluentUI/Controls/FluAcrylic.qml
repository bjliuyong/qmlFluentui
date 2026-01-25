import QtQuick
import Qt5Compat.GraphicalEffects
import FluentUI

Item {
    id: control
    property color tintColor: Qt.rgba(1, 1, 1, 1)
    property real tintOpacity: 0.65
    property real luminosity: 0.01
    property real noiseOpacity: 0.02
    property var target
    property int blurRadius: 32
    property rect targetRect: Qt.rect(control.x, control.y, control.width,control.height)
    ShaderEffectSource {
        id: effect_source
        anchors.fill: parent
        visible: false
        sourceRect: control.targetRect
        sourceItem: control.target
    }
    FastBlur {
        id: fast_blur
        anchors.fill: parent
        source: effect_source
        radius: control.blurRadius
    }
    Rectangle {
        anchors.fill: parent
        color: Qt.rgba(1, 1, 1, luminosity)
    }
    Rectangle {
        anchors.fill: parent
        color: Qt.rgba(tintColor.r, tintColor.g, tintColor.b, tintOpacity)
    }
    Image {
        anchors.fill: parent
        source: "qrc:/qt/qml/FluentUI/Image/noise.png"
        fillMode: Image.Tile
        opacity: control.noiseOpacity
    }
}
// import QtQuick
// import FluentUI

// Item {
//     id: control
//     property color tintColor: Qt.rgba(1, 1, 1, 1)
//     property real tintOpacity: 0.65
//     property real luminosity: 0.01
//     property real noiseOpacity: 0.02
//     property var target
//     property int blurRadius: 32
//     property rect targetRect: Qt.rect(control.x, control.y, control.width, control.height)

//     ShaderEffectSource {
//         id: effectSource
//         anchors.fill: parent
//         visible: false
//         sourceRect: control.targetRect
//         sourceItem: control.target
//         live: true
//     }

//     Item {
//         anchors.fill: parent
//         layer.enabled: true
//         layer.smooth: true
//         layer.effect: ShaderEffect {
//             property var source: effectSource
//             property real radius: control.blurRadius

//             fragmentShader: "
//                 uniform sampler2D source;
//                 uniform float radius;
//                 varying vec2 qt_TexCoord0;

//                 void main() {
//                     vec4 sum = vec4(0.0);
//                     float blur = radius / 100.0;

//                     sum += texture2D(source, qt_TexCoord0 + vec2(-blur, 0.0));
//                     sum += texture2D(source, qt_TexCoord0 + vec2( blur, 0.0));
//                     sum += texture2D(source, qt_TexCoord0 + vec2(0.0, -blur));
//                     sum += texture2D(source, qt_TexCoord0 + vec2(0.0,  blur));

//                     gl_FragColor = sum * 0.25;
//                 }
//             "
//         }
//     }

//     Rectangle {
//         anchors.fill: parent
//         color: Qt.rgba(1, 1, 1, luminosity)
//     }

//     Rectangle {
//         anchors.fill: parent
//         color: Qt.rgba(tintColor.r, tintColor.g, tintColor.b, tintOpacity)
//     }

//     Image {
//         anchors.fill: parent
//         source: "qrc:/qt/qml/FluentUI/Image/noise.png"
//         fillMode: Image.Tile
//         opacity: control.noiseOpacity
//     }
// }
