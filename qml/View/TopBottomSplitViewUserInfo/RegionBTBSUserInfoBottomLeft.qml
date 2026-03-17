import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI

Item {
    id: root
    anchors.fill: parent

    FluTreeView {
        id: tree_view
        anchors.fill: parent
        depthPadding: 25
        cellHeight: 36
        showLine: true

        columnSource: [
            {
                title: "部门名称",
                dataIndex: "name",
                width: tree_view.width - 10
            }
        ]

        // 静态测试数据
        Component.onCompleted: {
            dataSource = [
                {
                    name: "总局",
                    children: [
                        {
                            name: "第一分局",
                            children: [
                                { name: "行政部" },
                                { name: "技术部" },
                                { name: "运维部" }
                            ]
                        },
                        {
                            name: "第二分局",
                            children: [
                                { name: "管理部" },
                                { name: "档案室" }
                            ]
                        }
                    ]
                },
                {
                    name: "直属机构",
                    children: [
                        { name: "信息中心" },
                        { name: "培训基地" }
                    ]
                }
            ]
            allExpand()
        }
    }
}
