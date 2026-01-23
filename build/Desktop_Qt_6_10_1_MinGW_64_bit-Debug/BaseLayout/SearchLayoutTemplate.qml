import QtQuick
import QtQuick.Layouts
import "../../BaseComponent"

ColumnLayout {
    id: baseRoot
    anchors.fill: parent
    anchors.margins: 10
    spacing: 10

    // --- 1. 定义各部分的最小高度 ---
    readonly property int kHeaderMinH: 60
    readonly property int kBodyMinH: 200
    readonly property int kFooterMinH: 40
    readonly property int kLayoutMinW: 800

    // --- 2. 核心逻辑：计算并暴露组件的“底线”尺寸 ---
    // 高度底线 = 边距 + 间隙 + 各部分最小高度
    implicitHeight: (anchors.margins * 2) +
                    (spacing * 2) +
                    kHeaderMinH + kBodyMinH + kFooterMinH

    // 宽度底线
    implicitWidth: kLayoutMinW

    // ... 你的其他属性保持不变 ...
    property alias headerContent: headerContainer.data
    property alias bodyContent: bodyContainer.data
    property alias footerContent: footerContainer.data

    // 注意：netHeight 计算不需要改，它负责自适应逻辑
    readonly property real netHeight: height - (anchors.margins * 2) - (spacing * (visibleChildren.length - 1))

    // ================= HEADER =================
    ShadowBox {
        id: headerBox
        title: "Header"

        Layout.fillWidth: true
        Layout.minimumWidth: baseRoot.kLayoutMinW // 内部组件也要申明最小宽

        // 优先使用比例，但遇到底线（minimumHeight）则停止缩小
        Layout.preferredHeight: baseRoot.netHeight * 0.2
        Layout.minimumHeight: baseRoot.kHeaderMinH  // 关键：告诉 Layout 不要再压扁我了

        Item {
            id: headerContainer
            anchors.fill: parent
            onChildrenChanged: if (children.length > 0) children[0].anchors.fill = parent
        }

        Loader {
            anchors.fill: parent
            source: "./DefaultLayoutHeader.qml"
            active: headerContainer.children.length === 0
        }
    }

    // ================= BODY =================
    ShadowBox {
        id: bodyBox
        title: "Body"

        Layout.fillWidth: true
        Layout.minimumWidth: baseRoot.kLayoutMinW

        Layout.preferredHeight: baseRoot.netHeight * 0.5
        Layout.minimumHeight: baseRoot.kBodyMinH // 关键限制

        Item {
            id: bodyContainer
            anchors.fill: parent
            onChildrenChanged: if (children.length > 0) children[0].anchors.fill = parent
        }
    }

    // ================= FOOTER =================
    ShadowBox {
        id: footerBox
        title: "Footer"

        Layout.fillWidth: true
        Layout.minimumWidth: baseRoot.kLayoutMinW

        Layout.preferredHeight: baseRoot.netHeight * 0.3
        Layout.minimumHeight: baseRoot.kFooterMinH // 关键限制

        Item {
            id: footerContainer
            anchors.fill: parent
            onChildrenChanged: if (children.length > 0) children[0].anchors.fill = parent
        }
    }
}
