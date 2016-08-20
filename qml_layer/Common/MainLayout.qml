import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

ColumnLayout
{
    id: wrapper

    signal leftHeaderButtonClicked()
    signal rightHeaderButtonClicked()

    readonly property int headerHeight: 80

    property string leftHeaderButtonText: ""
    property string rightHeaderButtonText: ""
    property string centralHeaderText: ""

    property alias contentItem: content.data

    spacing: 0
	
    RowLayout
	{
        id: header

        Layout.fillWidth: true
        Layout.minimumHeight: wrapper.headerHeight
        Layout.preferredHeight: wrapper.headerHeight
        Layout.maximumHeight: wrapper.headerHeight

        spacing: 0
	
        Rectangle
        {
            id: backButton

            Layout.minimumWidth: parent.width * 0.15
            Layout.preferredWidth: parent.width * 0.15
            Layout.maximumWidth: parent.width * 0.15
            Layout.fillHeight: true

            color: "aqua"

            Text
            {
                text: wrapper.leftHeaderButtonText
                anchors.centerIn: parent
            }

            MouseArea
            {
                anchors.fill: parent

                onClicked:
                {
                    wrapper.leftHeaderButtonClicked()
                }
            }
        }
        Rectangle
        {
            id: statusLine

            Layout.fillWidth: true
            Layout.fillHeight: true

            color: "lightgreen"
            opacity: 0.5

            Text
            {
                text: wrapper.centralHeaderText
                anchors.centerIn: parent
            }

        }
        Rectangle
        {
            id: quitButton

            Layout.minimumWidth: parent.width * 0.15
            Layout.preferredWidth: parent.width * 0.15
            Layout.maximumWidth: parent.width * 0.15
            Layout.fillHeight: true

            color: "aqua"

            Text
            {
                text: wrapper.rightHeaderButtonText
                anchors.centerIn: parent
            }

            MouseArea
            {
                anchors.fill: parent

                onClicked:
                {
                    wrapper.rightHeaderButtonClicked()
                }
            }
        }
	}

    Rectangle
    {
        id: content

        Layout.fillWidth: true
        Layout.fillHeight: true

        color: "lightyellow"
    }
}
