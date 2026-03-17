// BaseLayout/qml/View/ViewUserInfo/RegionUserInfoEditDialog.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI
import "../../BizBaseComponent/BaseComp"
import "../../BizComponent"
import "../../LayoutTemplate/TopBottomSplit"

BizBaseDialogItem {
    id: dialogBio
    title: "生物信息采集"
    positiveText: "采集完成"
    negativeText: "取消采集"
    implicitWidth: 600
    implicitHeight: 400

    contentDelegate: Component {
        // 使用 Item 作为容器来处理边距 (Padding)
        Item {
            // 设置一个合适的固定宽度，或者根据父级计算
            // implicitWidth: 800
            // 高度由内部内容撑开，并加上上下边距
            implicitHeight: 300

            GridLayout {
              id: headerIte
              property string scopeFormId: "bioForm"
              anchors.fill: parent
              anchors.margins: 20
              columns: 2

              rowSpacing: 20
              Rectangle {
                id: fingerprint
                Layout.preferredHeight: parent.height-20
                Layout.preferredWidth: 270
                RowLayout {
                  spacing: 20
                  anchors.centerIn: parent
                  Rectangle {
                    width: 120
                    height: 150
                    color: FluColors.Grey20
                    FluImage {
                      source: "qrc:/images/user_fingerprint_1.png"
                      anchors.centerIn: parent
                      scale: 0.3  // 放大1.5倍
                      smooth: true
                    }
                  }
                  Rectangle {
                    width: 120
                    height: 150
                    color: FluColors.Grey20
                    FluImage {
                      source: "qrc:/images/user_fingerprint_1.png"
                      anchors.centerIn: parent
                      scale: 0.3  // 放大1.5倍
                      smooth: true
                    }
                  }
                }
              }
              Rectangle {
                id: picture
                Layout.preferredHeight:  parent.height-20
                Layout.preferredWidth: 270
                color: FluColors.Grey20
                FluImage {
                  anchors.centerIn: parent
                  source: "qrc:/images/user_photo.png"
                  width: 150
                  height: 220
                }
              }

              Rectangle {
                Layout.preferredHeight: 20
                Layout.preferredWidth: 270
                RowLayout {
                  spacing: 20
                  anchors.centerIn: parent
                    FluFilledButton {
                        text: "采集左手拇指"
                    }
                    FluFilledButton {
                        text: "采集右手拇指"
                    }
                }
              }

              Rectangle {
                Layout.preferredHeight: 20
                Layout.preferredWidth: 270
                FluFilledButton {
                  anchors.centerIn: parent
                    text: "采集照片"
                }
              }
            }

        }
    }
}

