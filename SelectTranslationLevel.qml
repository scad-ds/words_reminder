import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

MainLayout
{
	id: wrapper

    function selectionSwitcher(index)
    {
        if( index === 0 )
        {
            wrapper.byLevelClicked()
        }
    }

    leftHeaderButtonText: qsTr("Back")
    rightHeaderButtonText: qsTr("Quit")
    centralHeaderText: qsTr("Level Status line...")

    ListModel
    {
        id: selectionModel

        ListElement
        {
            name: "BLES"
        }
        ListElement
        {
            name: "GRAS"
        }
        ListElement
        {
            name: "Level 1"
        }
        ListElement
        {
            name: "Level 2"
        }
        ListElement
        {
            name: "Level 3"
        }
        ListElement
        {
            name: "Level 4"
        }
        ListElement
        {
            name: "Level 5"
        }
        ListElement
        {
            name: "Advanced"
        }
    }

    contentItem: FocusScope {

        anchors.fill: parent

        GridView
        {
            id: gridView

            width: gridView.cellWidth * 3
            height: parent.height * 0.75

            anchors.centerIn: parent

            cellWidth: 140
            cellHeight: 140

            model: selectionModel
            delegate: Item {
                width: gridView.cellWidth
                height: gridView.cellHeight

                ColumnLayout {
                    anchors.fill: parent

                    Rectangle
                    {
                        width: gridView.cellWidth * 0.8
                        height: gridView.cellHeight * 0.8
                        color: "green"
                        anchors.horizontalCenter: parent.horizontalCenter

                        Text
                        {
                            text: name
                            anchors.centerIn: parent
                        }
                    }
                }
            }
        }
    }

}
