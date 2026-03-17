import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../../BizBaseComponent/BaseComp"

BizBaseTabItem {
    id: root
    title: "用户管理"

    // 静态测试数据
    property var pageData: [
        { idNum: "110101199001011234", policeId: "P001", personName: "张三", deptCode: "D001", orderNum: 1, userTypeCode: "管理员" },
        { idNum: "110101199002022345", policeId: "P002", personName: "李四", deptCode: "D001", orderNum: 2, userTypeCode: "普通用户" },
        { idNum: "110101199003033456", policeId: "P003", personName: "王五", deptCode: "D002", orderNum: 3, userTypeCode: "普通用户" },
        { idNum: "110101199004044567", policeId: "P004", personName: "赵六", deptCode: "D002", orderNum: 4, userTypeCode: "审核员" },
        { idNum: "110101199005055678", policeId: "P005", personName: "钱七", deptCode: "D003", orderNum: 5, userTypeCode: "普通用户" },
        { idNum: "110101199006066789", policeId: "P006", personName: "孙八", deptCode: "D003", orderNum: 6, userTypeCode: "管理员" },
        { idNum: "110101199007077890", policeId: "P007", personName: "周九", deptCode: "D004", orderNum: 7, userTypeCode: "普通用户" },
        { idNum: "110101199008088901", policeId: "P008", personName: "吴十", deptCode: "D004", orderNum: 8, userTypeCode: "审核员" }
    ]

    FluTableView {
        id: userTableView
        anchors.fill: parent

        columnSource: [
            { title: "身份证号",   dataIndex: "idNum",        width: userTableView.width / 5 },
            { title: "警号",      dataIndex: "policeId",     width: userTableView.width / 5 },
            { title: "姓名",      dataIndex: "personName",   width: userTableView.width / 5 },
            { title: "部门代码",   dataIndex: "deptCode",     width: userTableView.width / 5 },
            { title: "用户类型",   dataIndex: "userTypeCode", width: userTableView.width / 5 }
        ]

        dataSource: root.pageData
    }
}
