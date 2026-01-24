// BaseLayout/qml/View/ViewUserInfo/ViewUserInfo.qml
import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import "../../LayoutTemplate"

ColumnLayout {
    anchors.fill: parent
    // 使用模板的最小尺寸作为自身的隐式尺寸
    implicitWidth: searchLayout.staticMinWidth
    implicitHeight: searchLayout.staticMinHeight

    LayoutHeaderBodyFooterTemp {
        id: searchLayout

        Layout.fillWidth: true
        Layout.fillHeight: true

        // 设置三个部分的比例
        headerWeight: 1
        bodyWeight: 8
        footerWeight: 1

        headerContent: RegionUserInfoHeader{}
        bodyContent: RegionUserInfoBody{}
        footerContent: RegionUserInfoFooter{}
    }
}
