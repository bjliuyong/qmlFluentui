// BaseLayout/qml/BizBaseComponent/BizViewItem.qml
import QtQuick
import "../../BizBaseComponent/BaseComp"
// 所有区域组件（Header/Body/Footer）都继承这个基类
BizBaseViewItem {
    id: root

    // 访问 Header 区域
    property var headerContent: null

    // 访问 Footer 区域
    property var bodyContent: null

    // 访问 Body 区域
    property var footerContent: null

    // 访问所有弹窗 (Map: { "弹窗名": item })
    property var dialogContent: ({})

    // 访问模板自身
    property var rootContent: null


}
