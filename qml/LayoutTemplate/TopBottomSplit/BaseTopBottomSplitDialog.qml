import QtQuick
import "../../BizBaseComponent/BaseComp"
BizBaseDialogItem {
    id: root

    // 在你的子页面组件中添加
    property var topContent: null
    property var bottomLeftContent: null
    property var bottomRightTopContent: null
    property var bottomRightBottomContent: null

    // 访问所有弹窗 (Map: { "弹窗名": item })
    property var dialogContent: ({})

    // 访问模板自身
    property var rootContent: null


}
