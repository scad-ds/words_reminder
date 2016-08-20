import QtQuick 2.7
import QtQuick.Controls 1.4

FocusScope
{
	id: wrapper
	
	Rectangle
	{
	    anchors.fill: parent
	
	    color: "gray"
	    anchors.centerIn: parent
	
	    Text
	    {
	        text: qsTr("Loading...")
	        anchors.centerIn: parent
	    }
	}
}
