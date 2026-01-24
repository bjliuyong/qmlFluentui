import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../../BizComponent"
// import "./Bus.js" as Bus

RowLayout{
    id: root
    // anchors.fill: parent
    BizTextInput{
        formId: "userForm"
        key: "docNum"
        label: "证件号"
        labelRatio: 3
        inputRatio: 4
        tailRatio: 1
    }

}
