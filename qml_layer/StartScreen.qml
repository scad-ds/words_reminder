import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

FocusScope
{
	id: wrapper
	
	signal startClicked()
	
	Rectangle
	{
	    anchors.fill: parent
	    visible: true
	
	    color: "lightyellow"
	    anchors.centerIn: parent
	
	    Rectangle
	    {
	        id: startButton
	
	        width: 200
	        height: 50
	        color: "lightblue"
	        anchors.centerIn: parent
	
	        Text
	        {
	            text: qsTr("START")
	            anchors.centerIn: parent
	        }
	
	        MouseArea
	        {
	            anchors.fill: parent
	
	            onClicked:
	            {
	                wrapper.startClicked()
	            }
	        }
	    }
	}
}