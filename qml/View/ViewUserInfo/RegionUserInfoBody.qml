// BaseLayout/qml/View/ViewUserInfo/RegionUserInfoFooter.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../../BizComponent"
import "../../LayoutTemplate/HeaderBodyFooter"

BaseHeaderBodyFooterItem {
    id: root
    anchors.fill: parent


    // 模拟数据
    property var allData: [
           {
               id_num: "1001",
               version_num: "V1.0.0",
               police_id: "PJ001",
               person_name: "张三",
               dept_id: "D001",
               order_num: "1",
               attendance_num: "A001",
               user_type_code: "普通用户"
           },
           {
               id_num: "1002",
               version_num: "V1.0.1",
               police_id: "PJ002",
               person_name: "李四",
               dept_id: "D002",
               order_num: "2",
               attendance_num: "A002",
               user_type_code: "管理员"
           },
           {
               id_num: "1003",
               version_num: "V1.0.2",
               police_id: "PJ003",
               person_name: "王五",
               dept_id: "D003",
               order_num: "3",
               attendance_num: "A003",
               user_type_code: "普通用户"
           },
           {
               id_num: "1004",
               version_num: "V1.0.3",
               police_id: "PJ004",
               person_name: "赵六",
               dept_id: "D001",
               order_num: "4",
               attendance_num: "A004",
               user_type_code: "普通用户"
           },
           {
               id_num: "1005",
               version_num: "V1.0.4",
               police_id: "PJ005",
               person_name: "钱七",
               dept_id: "D002",
               order_num: "5",
               attendance_num: "A005",
               user_type_code: "管理员"
           },
           {
               id_num: "1006",
               version_num: "V1.0.5",
               police_id: "PJ006",
               person_name: "孙八",
               dept_id: "D003",
               order_num: "6",
               attendance_num: "A006",
               user_type_code: "普通用户"
           },
           {
               id_num: "1007",
               version_num: "V1.0.6",
               police_id: "PJ007",
               person_name: "周九",
               dept_id: "D001",
               order_num: "7",
               attendance_num: "A007",
               user_type_code: "普通用户"
           },
           {
               id_num: "1008",
               version_num: "V1.0.7",
               police_id: "PJ008",
               person_name: "吴十",
               dept_id: "D002",
               order_num: "8",
               attendance_num: "A008",
               user_type_code: "管理员"
           },
           {
               id_num: "1009",
               version_num: "V1.0.8",
               police_id: "PJ009",
               person_name: "郑十一",
               dept_id: "D003",
               order_num: "9",
               attendance_num: "A009",
               user_type_code: "普通用户"
           },
           {
               id_num: "1010",
               version_num: "V1.0.9",
               police_id: "PJ010",
               person_name: "王十二",
               dept_id: "D001",
               order_num: "10",
               attendance_num: "A010",
               user_type_code: "普通用户"
           }
       ]



    Column {
        anchors.fill: parent
        spacing: 5

        // 表格
        FluTableView {
            width: parent.width
            height: parent.height - 50

            columnSource: [
                { title: "身份证号", dataIndex: "id_num", width: 200 },
                { title: "版本号", dataIndex: "version_num", width: 200 },
                { title: "警号", dataIndex: "police_id", width: 200 },
                { title: "姓名", dataIndex: "person_name", width: 200 },
                { title: "部门ID", dataIndex: "dept_id", width: 200 },
                { title: "排序号", dataIndex: "order_num", width: 200 },
                { title: "考勤卡号", dataIndex: "attendance_num", width: 200 },
                { title: "用户类型", dataIndex: "user_type_code", width: 200 }
            ]

            dataSource: allData
        }
        FluPagination{
            anchors.right: parent.right
            pageCurrent: 1
            itemCount: 1000
            pageButtonCount: 9
        }
        }
}
