
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI
import "../DataManager"

BizBaseCompDataManager {
	id: control

	/* ========= 公共属性 ========= */
	property string label: "标题"                 // 标签文本内容
	property bool required: false                 // 是否必填项

	// 布局控制属性
	property int labelWidth: 120                   // 标签区固定宽度（用于网格绝对对齐）



	property int spacing: 20                      // 布局间距
	property int lableFontSize: FluTextStyle.Body.pixelSize  // label字体大小
	property color lableTextColor: FluTheme.fontPrimaryColor // label字体颜色

	// 内容插槽
	default property alias content: contentSlot.data

	implicitHeight: 32                            // 控件的隐式高度
	Layout.fillWidth: true                        // 填充父容器宽度

	/* ========= 布局实现 ========= */
	RowLayout {
		anchors.fill: parent                       // 填充父对象
		spacing: control.spacing              // 使用统一间距
		FluText {
			text: control.label
			// required: control.required
			font.pixelSize: lableFontSize       // label字体大小
			Layout.preferredWidth: control.labelWidth
			Layout.alignment: Qt.AlignVCenter
		}

		/* --- B. 中间输入区 (插槽) --- */
		Item {
			id: contentSlot                       // 插槽容器

			onChildrenChanged: {                  // 当子元素变化时触发，自动拉伸插槽内容
				for(var i=0; i<children.length; i++) {
					let child = children[i];
					if (child && child.hasOwnProperty("anchors")) {
						child.anchors.fill = contentSlot
					}
				}
			}

			Layout.fillWidth: true                // 贪婪吸收剩余所有宽度
			Layout.fillHeight: true
			implicitHeight: 32
		}
	}
}
