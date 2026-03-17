import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI

FluScrollablePage {
    title: "Global Custom Color Test View"
    
    FluFrame {
        Layout.fillWidth: true
        Layout.topMargin: 20
        padding: 20
        ColumnLayout {
            spacing: 20
            
            FluText {
                text: "1. Global Theme & Core Colors"
                font: FluTextStyle.Title
                color: FluTheme.textHighlightColor
            }
            
            Flow {
                spacing: 20
                Layout.fillWidth: true
                
                // Theme Switcher
                ColumnLayout {
                    FluText { text: "Current Theme:"; font: FluTextStyle.BodyStrong }
                    FluComboBox {
                        model: ["Light", "Dark", "Blue", "Green"]
                        currentIndex: {
                            var idx = model.indexOf(FluTheme.theme)
                            return idx === -1 ? 0 : idx
                        }
                        onActivated: {
                            FluTheme.theme = displayText
                            FluTheme.refreshColors()
                        }
                    }
                }

                // Primary / Check Color
                ColumnLayout {
                    FluText { text: "Primary/Check Color:"; font: FluTextStyle.BodyStrong }
                    FluColorPicker {
                        current: FluTheme.checkColor
                        onAccepted: {
                            FluTheme.checkColor = current
                            FluTheme.borderCheckColor = current
                            FluTheme.checkedColor = current
                            FluTheme.borerlessColor = current
                            FluTheme.selectedBorderColor = current
                            FluTheme.primaryColor = current
                            FluTheme.refreshColors()
                        }
                    }
                }

                // Background Color
                ColumnLayout {
                    FluText { text: "Page Background:"; font: FluTextStyle.BodyStrong }
                    FluColorPicker {
                        current: FluTheme.backgroundColor
                        onAccepted: FluTheme.backgroundColor = current
                    }
                }

                // Control Normal Color
                ColumnLayout {
                    FluText { text: "Control Inner Color:"; font: FluTextStyle.BodyStrong }
                    FluColorPicker {
                        current: FluTheme.controlNormalColor
                        onAccepted: FluTheme.controlNormalColor = current
                    }
                }

                // Selected Color
                ColumnLayout {
                    FluText { text: "Selected Color:"; font: FluTextStyle.BodyStrong }
                    FluColorPicker {
                        current: FluTheme.selectedColor
                        onAccepted: FluTheme.selectedColor = current
                    }
                }

                // Selected Row Text Color
                ColumnLayout {
                    FluText { text: "Selected Row Text:"; font: FluTextStyle.BodyStrong }
                    FluColorPicker {
                        current: FluTheme.selectedTextColor
                        onAccepted: FluTheme.selectedTextColor = current
                    }
                }

                // Item Hover Color
                ColumnLayout {
                    FluText { text: "Hover Color:"; font: FluTextStyle.BodyStrong }
                    FluColorPicker {
                        current: FluTheme.itemHoverColor
                        onAccepted: FluTheme.itemHoverColor = current
                    }
                }

                // Header Normal Color
                ColumnLayout {
                    FluText { text: "Header Normal:"; font: FluTextStyle.BodyStrong }
                    FluColorPicker {
                        current: FluTheme.headerNormalColor
                        onAccepted: FluTheme.headerNormalColor = current
                    }
                }

                // Header Hover Color
                ColumnLayout {
                    FluText { text: "Header Hover:"; font: FluTextStyle.BodyStrong }
                    FluColorPicker {
                        current: FluTheme.headerHoverColor
                        onAccepted: FluTheme.headerHoverColor = current
                    }
                }
            }

            FluDivider { Layout.fillWidth: true }

            FluText {
                text: "2. Detailed Borders & Text"
                font: FluTextStyle.Title
                color: FluTheme.textHighlightColor
            }

            Flow {
                spacing: 20
                Layout.fillWidth: true

                ColumnLayout {
                    FluText { text: "Border Normal:"; font: FluTextStyle.BodyStrong }
                    FluColorPicker {
                        current: FluTheme.borderNormalColor
                        onAccepted: FluTheme.borderNormalColor = current
                    }
                }

                ColumnLayout {
                    FluText { text: "Text Primary:"; font: FluTextStyle.BodyStrong }
                    FluColorPicker {
                        current: FluTheme.textColor
                        onAccepted: FluTheme.textColor = current
                    }
                }

                ColumnLayout {
                    FluText { text: "Text Highlight:"; font: FluTextStyle.BodyStrong }
                    FluColorPicker {
                        current: FluTheme.textHighlightColor
                        onAccepted: FluTheme.textHighlightColor = current
                    }
                }
            }
        }
    }

    FluFrame {
        Layout.fillWidth: true
        Layout.topMargin: 20
        padding: 20
        ColumnLayout {
            spacing: 20
            FluText {
                text: "3. Interactive Component Previews"
                font: FluTextStyle.Title
                color: FluTheme.textHighlightColor
            }

            RowLayout {
                spacing: 20
                FluButton { text: "Standard Button" }
                FluFilledButton { text: "Filled Button" }
                FluTextButton { text: "Text Button" }
                FluIconButton { iconSource: FluentIcons.Settings }
            }

            RowLayout {
                spacing: 25
                FluCheckBox { text: "Check Box"; checked: true }
                FluRadioButton { text: "Radio Button"; checked: true }
                FluToggleSwitch { text: "Toggle Switch"; checked: true }
            }

            RowLayout {
                spacing: 20
                FluTextBox {
                    placeholderText: "Edit me..."
                    width: 200
                }
                FluSpinBox { value: 50 }
                FluComboBox {
                    model: ["Sample 1", "Sample 2"]
                    width: 150
                }
            }

            ColumnLayout {
                spacing: 10
                Layout.fillWidth: true
                FluText { text: "Progress Indicators:"; font: FluTextStyle.BodyStrong }
                RowLayout {
                    spacing: 20
                    FluProgressBar {
                        value: 0.6
                        Layout.fillWidth: true
                    }
                    FluProgressRing { value: 0.6 }
                }
            }

            FluDivider { Layout.fillWidth: true }

            FluText {
                text: "4. Multi-State Simulation"
                font: FluTextStyle.Subtitle
            }
            RowLayout {
                spacing: 20
                FluButton { text: "Disabled Button"; enabled: false }
                FluCheckBox { text: "Disabled Check"; checked: true; enabled: false }
                FluTextBox { text: "Read Only Text"; readOnly: true; width: 200 }
            }

            FluDivider { Layout.fillWidth: true }

            FluText {
                text: "5. TableView Theme Test"
                font: FluTextStyle.Title
                color: FluTheme.textHighlightColor
            }

            FluTableView {
                id: table_view
                Layout.fillWidth: true
                height: 300
                columnSource: [
                    {title: "ID", dataIndex: "id", width: 50},
                    {title: "Name", dataIndex: "name", width: 150},
                    {title: "Role", dataIndex: "role", width: 150},
                    {title: "Status", dataIndex: "status", width: 100}
                ]
                dataSource: [
                    {id: 1, name: "Alice", role: "Administrator", status: "Active"},
                    {id: 2, name: "Bob", role: "Developer", status: "Away"},
                    {id: 3, name: "Charlie", role: "Designer", status: "Active"},
                    {id: 4, name: "David", role: "Tester", status: "Offline"},
                    {id: 5, name: "Eve", role: "Support", status: "Active"},
                    {id: 6, name: "Frank", role: "Manager", status: "Active"},
                    {id: 7, name: "Grace", role: "Developer", status: "Away"},
                    {id: 8, name: "Heidi", role: "Designer", status: "Offline"},
                    {id: 9, name: "Ivan", role: "Developer", status: "Active"},
                    {id: 10, name: "Judy", role: "Support", status: "Active"}
                ]
            }
            FluDivider { Layout.fillWidth: true }

            FluText {
                text: "6. TreeView Theme Test"
                font: FluTextStyle.Title
                color: FluTheme.textHighlightColor
            }

            FluTreeView {
                id: tree_view
                Layout.fillWidth: true
                height: 300
                columnSource: [
                    {title: "Name", dataIndex: "name", width: 250},
                    {title: "Info", dataIndex: "info", width: 150}
                ]
                dataSource: [
                    { name: "Root Node 1", info: "Details 1", children: [
                        { name: "Child 1.1", info: "Sub-detail 1" },
                        { name: "Child 1.2", info: "Sub-detail 2", children: [
                            { name: "Grandchild 1.2.1", info: "Deep detail" }
                        ]}
                    ]},
                    { name: "Root Node 2", info: "Details 2", children: [
                        { name: "Child 2.1", info: "Sub-detail 3" }
                    ]}
                ]
            }
        }
    }
}
