// BaseLayout/qml/View/ViewUserInfo/RegionUserInfoFooter.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
import "../../BizComponent"
import "../../LayoutTemplate/TopBottomSplit"
import "../../BizBaseComponent/BaseComp"
BizBaseViewItem {
    id: root
    property int currentPage: 1
    property int pageSize: 10
    property int totalCount: 0
    property int totalPages: 0
    property var pageData: []
    property var nodeType
    property var nodeCode

    property int allCheckState: Qt.Unchecked

    signal checkBoxChanged()

    onCheckBoxChanged: {
        updateAllCheck()
    }

    function updateAllCheck() {
        let checkedCount = 0
        for (var i = 0; i < userTableView.rows; i++) {
            if (userTableView.getRow(i).checkbox.options.checked) {
                checkedCount += 1
            }
        }
        if (checkedCount > 0 && checkedCount === userTableView.rows) {
            root.allCheckState = Qt.Checked
        } else if (checkedCount > 0 && checkedCount < userTableView.rows) {
            root.allCheckState = Qt.PartiallyChecked
        } else {
            root.allCheckState = Qt.Unchecked
        }
    }

   function queryUserListEx(param)
   {
       nodeType = param.nodeType;
       nodeCode = param.code;
       queryUserList(currentPage,pageSize)
   }

   function queryUserList(pageNum, pageSizeParam) {

                    const params = {
                        urlMethod: "/sys/user/list",
                        businessParams: {
                            pageNum: pageNum || currentPage,
                            pageSize: pageSizeParam || pageSize
                        }
                    }

                    // 根据treeTypeFlag条件添加unitCode
                    if (nodeType === "1" || nodeType === "2") {
                                     var lsit = []
                                     lsit.push(nodeCode)
                        params.businessParams.unitCodeList = lsit;
                    }else if(nodeType === "3"){
                        params.businessParams.deptCode = nodeCode;
                    }
                  console.log("======================",JSON.stringify(params))

         commonController.inspectionPostBusinessParamsQml(params, function(result) {
             console.log("=== 接口回调 ===");
             console.log(JSON.stringify(result))
             if (!result || result.code !== 100000 || !result.data) {
                 console.log("接口返回错误或无效数据:", result?.message || "未知错误");
                 pageData = [];
                 totalCount = 0;
                 totalPages = 0;
                 return;
             }

             const { rows = [], total = 0 } = result.data;
             console.log("获取到数据:", rows.length, "条，总数:", total);

             for (var i = 0; i < rows.length; i++) {
                 if (!rows[i]
                         || typeof rows[i] !== "object") {
                     continue
                 }
                 console.log(JSON.stringify(rows[i]))

                 rows[i].checkbox = userTableView.customItem(com_checbox,{checked:false})
             }
             pageData = rows
             totalCount = total;
             totalPages = Math.ceil(totalCount / pageSize);

             console.log("更新分页完成");
         });
     }

   Component{
       id:com_column_checbox
       Item{
           RowLayout{
               anchors.centerIn: parent
               FluText{
                   text: qsTr("")
                   Layout.alignment: Qt.AlignVCenter
               }
               FluCheckBox {
                   Layout.alignment: Qt.AlignVCenter
                   checkState: root.allCheckState
                   animationEnabled: false
                   clickListener: function () {
                       root.allCheckState = checkState
                       for (let i = 0; i < userTableView.rows; i++) {
                           const rowData = userTableView.getRow(i)
                           rowData.checkbox = userTableView.customItem(com_checbox, {"checked": checkState === Qt.Checked})
                           userTableView.setRow(i, rowData)
                       }
                   }
               }
           }
       }
   }
   Component{
       id:com_checbox
       Item{
           FluCheckBox{
               anchors.centerIn: parent
               checked: true === options.checked
               animationEnabled: false
               clickListener: function(){
                   var obj = userTableView.getRow(row)
                   obj.checkbox = userTableView.customItem(com_checbox,{checked})
                   userTableView.setRow(row,obj)
                   root.checkBoxChanged()
               }
           }
       }
   }

    ColumnLayout {
        anchors.fill: parent
        spacing: 5

        // 表格

        FluTableView {
            id: userTableView

            Layout.fillHeight: true
            Layout.fillWidth: true

            columnSource: [
                  {
                       title: userTableView.customItem(com_column_checbox,{checked:false}),
                       "dataIndex": 'checkbox',
                       "frozen": true,
                       "width": 40
                  },
                  { title: "身份证号", dataIndex: "idNum", width: (userTableView.width-40)/8 },
                  { title: "版本号", dataIndex: "versionNum", width: (userTableView.width-40)/8 },
                  { title: "警号", dataIndex: "policeId", width: (userTableView.width-40)/8 },
                  { title: "姓名", dataIndex: "personName", width: (userTableView.width-40)/8 },
                  { title: "部门ID", dataIndex: "deptCode", width: (userTableView.width-40)/8 },
                  { title: "排序号", dataIndex: "orderNum", width: (userTableView.width-40)/8 },
                  { title: "考勤卡号", dataIndex: "attendanceNum", width: (userTableView.width-40)/8 },
                  { title: "用户类型", dataIndex: "userTypeCode", width: (userTableView.width-40)/8 }

              ]

            dataSource: pageData
            onCurrentChanged: {
                bottomRightBottomContent.clearForm("userInfo")
                bottomRightBottomContent.setFormData(current,"userInfo")
                bottomRightBottomContent.updateUserBindRoleInfo()
            }
        }



        RowLayout{
            id: paginationLayout
             Layout.fillWidth: true
            Layout.preferredHeight: 40
            Layout.minimumHeight: 40
            Layout.maximumHeight: 40
              spacing: 10
              // 页面大小选择器
              RowLayout {
                  spacing: 10


                  FluText {
                      text: "每页显示:"
                      font.pixelSize: 14
                  }

                  FluComboBox {
                      id: pageSizeCombo
                      width: 100
                      model: [3, 5, 10, 20]
                      currentIndex: model.indexOf(pageSize)

                      onCurrentIndexChanged: {
                          if (currentIndex >= 0) {
                              pageSize = model[currentIndex];
                              currentPage = 1;
                              queryUserList(currentPage, pageSize);
                          }
                      }
                  }
                  FluText {
                      text: "条记录"
                      font.pixelSize: 14
                  }
              }

            Item{
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            // 分页控件
            FluPagination {
                id: pagination


                itemCount: totalCount
                pageCurrent: currentPage
                pageButtonCount: Math.min(totalPages, 9)
                __itemPerPage: pageSize

                onPageCurrentChanged: {
                    queryUserList(pageCurrent, pageSize);
                }

                on__ItemPerPageChanged: {
                    pageCurrent = 1;
                    queryUserList(1, pageSize);
                }
            }
        }
    }
}
