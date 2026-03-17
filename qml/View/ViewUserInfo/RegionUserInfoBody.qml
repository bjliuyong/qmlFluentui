// BaseLayout/qml/View/ViewUserInfo/RegionUserInfoFooter.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../../BizBaseComponent/BaseComp"
import "../../LayoutTemplate/HeaderBodyFooter"
import "../../LayoutTemplate/TopBottomSplit"

BizBaseTabItem {
    id: root
    anchors.fill: parent

    function queryUserList(param) {

        try {
            var params = {};
            params.urlMethod = "/sys/user/list";
            params.businessParams = param;

            commonController.inspectionPostBusinessParamsQml(params, function(result) {

               allData = result.data.rows;

            });
        } catch(ex) {
            console.log(ex.message)
        }
    }

    Component.onCompleted: {
        queryUserList()
    }

    // 模拟数据
    property var allData: []

    contentItem:ColumnLayout {
        anchors.fill: parent
        spacing: 5


        // 表格
        FluTableView {
            id: tableView
            Layout.fillHeight: true
            Layout.fillWidth: true

            columnSource: [
                { title: "身份证号", dataIndex: "idNum", width: (tableView.width-40)/8 },
                { title: "版本号", dataIndex: "versionNum", width: (tableView.width-40)/8 },
                { title: "警号", dataIndex: "policeId", width: (tableView.width-40)/8 },
                { title: "姓名", dataIndex: "personName", width: (tableView.width-40)/8 },
                { title: "部门ID", dataIndex: "deptId", width: (tableView.width-40)/8 },
                { title: "排序号", dataIndex: "orderNum", width: (tableView.width-40)/8 },
                { title: "考勤卡号", dataIndex: "attendanceNum", width: (tableView.width-40)/8 },
                { title: "用户类型", dataIndex: "userTypeCode", width: (tableView.width-40)/8 }
            ]

            dataSource: allData
        }
        FluPagination{

            pageCurrent: 1
            itemCount: 1000
            pageButtonCount: 9
        }
    }
}
