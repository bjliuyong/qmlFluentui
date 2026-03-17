import QtQuick

QtObject {
	required property string key;
	property string formId;
	property var value : "";
	function getValue(){
		return value
	}
	function setValue(newV){
		value = newV
	}
}
