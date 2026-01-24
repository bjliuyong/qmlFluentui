import QtQuick
import QtQuick.Layouts
import "../../BaseComponent"

ColumnLayout {
    id: baseRoot
    anchors.fill: parent
    anchors.margins: kMargin
    spacing: kSpacing

    // =========================================================
    // 1. 定义各部分的最小高度 (硬性底线，防止压扁)
    // =========================================================
    readonly property int kMargin: 10
    readonly property int kSpacing: 10
    readonly property int kHeaderMinH: 60
    readonly property int kBodyMinH: 200
    readonly property int kFooterMinH: 100
    readonly property int kLayoutMinW: 800

    // =========================================================
    // 2. 【核心修改】定义高度比例 (Ratio)
    //    外部只传递 0.0 ~ 1.0 之间的小数
    //    默认值：0.2 : 0.5 : 0.3
    // =========================================================
    property real headerHeightRatio: 0.2
    property real bodyHeightRatio:   0.5
    property real footerHeightRatio: 0.3

    // =========================================================
    // 3. 基础计算逻辑
    // =========================================================
    // 隐式高度（用于 Window minimumHeight 绑定）
    readonly property int staticMinHeight: (kMargin * 2) +
                                               (kSpacing * 2) +
                                               kHeaderMinH +
                                               kBodyMinH +
                                               kFooterMinH
    readonly property int staticMinWidth: kLayoutMinW + (kMargin * 2)

    onImplicitHeightChanged: {
        console.log(implicitHeight,anchors.margins,spacing,kHeaderMinH,kBodyMinH,kFooterMinH)
    }

    // 内容接口
    readonly property string _Default_HeaderPath: "./DefaultLayoutHeader.qml"
    property alias headerContent: headerContainer.data
    property alias bodyContent: bodyContainer.data
    property alias footerContent: footerContainer.data

    // 净高度：总高度 - 边距 - 间隙
    readonly property real netHeight: height - (anchors.margins * 2) - (spacing * (visibleChildren.length - 1))

    // ================= HEADER =================
    ShadowBox {
        id: headerBox
        title: "Header"

        Layout.fillWidth: true
        Layout.minimumWidth: baseRoot.kLayoutMinW

        // 🟢 自动计算：净高度 * 比例
        Layout.preferredHeight: baseRoot.netHeight * baseRoot.headerHeightRatio
        Layout.minimumHeight: baseRoot.kHeaderMinH // 即使比例算出来很小，也不能小于 60px

        Item {
            id: headerContainer
            anchors.fill: parent
            onChildrenChanged: if (children.length > 0) children[0].anchors.fill = parent
        }

        Loader {
            id: defaultHeaderLoader
            anchors.fill: parent
            source: _Default_HeaderPath
            active: headerContainer.children.length === 0
        }
    }

    // ================= BODY =================
    ShadowBox {
        id: bodyBox
        title: "Body"

        Layout.fillWidth: true
        Layout.minimumWidth: baseRoot.kLayoutMinW


        Layout.preferredHeight: baseRoot.netHeight * baseRoot.bodyHeightRatio
        Layout.minimumHeight: baseRoot.kBodyMinH

        // Body 通常建议开启 fillHeight，以防比例之和 < 1.0 时底部留白
        // 如果你的比例加起来严格等于 1.0，这个属性不加也行，但加上更稳健
        Layout.fillHeight: true

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

        // 🟢 自动计算
        Layout.preferredHeight: baseRoot.netHeight * baseRoot.footerHeightRatio
        Layout.minimumHeight: baseRoot.kFooterMinH

        Item {
            id: footerContainer
            anchors.fill: parent
            onChildrenChanged: if (children.length > 0) children[0].anchors.fill = parent
        }
    }
}
