import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

ColumnLayout
{
    id: wrapper

    signal backClicked()
    signal quitClicked()

    signal byLevelClicked()

    readonly property int headerHeight: 80

    function selectionSwitcher(index)
    {
        if( index === 0 )
        {
            wrapper.byLevelClicked()
        }
    }

    spacing: 0

    ListModel
    {
        id: selectionModel

        ListElement
        {
            name: "By levels"
        }
        ListElement
        {
            name: "All verbs"
        }
        ListElement
        {
            name: "Irregular verbs"
        }
    }
	
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
                text: qsTr("Back")
                anchors.centerIn: parent
            }

            MouseArea
            {
                anchors.fill: parent

                onClicked:
                {
                    wrapper.backClicked()
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
                text: qsTr("Status line...")
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
                text: qsTr("Quit")
                anchors.centerIn: parent
            }

            MouseArea
            {
                anchors.fill: parent

                onClicked:
                {
                    wrapper.quitClicked()
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

        ListView
        {
            id: selectionListView

            width: parent.width * 0.8
            height: selectionListView.contentHeight
            anchors.centerIn: parent
            spacing : 10

            boundsBehavior: Flickable.StopAtBounds

            model: selectionModel

            delegate: Rectangle {
                width: selectionListView.width
                height: 50

                Text
                {
                    id: dlg

                    anchors.centerIn: parent
                    text: name /*from model*/
                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        wrapper.selectionSwitcher(index)
                    }
                }
            }
        }
    }
}
