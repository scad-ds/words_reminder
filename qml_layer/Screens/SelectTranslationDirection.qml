import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import "qrc:/qml_layer/Common" as Common

Common.MainLayout
{
	id: wrapper

    signal byLevelClicked()

    function selectionSwitcher(index)
    {
        if( index === 0 )
        {
            wrapper.byLevelClicked()
        }
    }

    leftHeaderButtonText: qsTr("Back")
    rightHeaderButtonText: qsTr("Quit")
    centralHeaderText: qsTr("Status line...")

    ListModel
    {
        id: selectionModel

        ListElement
        {
            name: "Eng -> Rus"
        }
        ListElement
        {
            name: "Rus -> Eng"
        }
        ListElement
        {
            name: "Mix"
        }
    }

    contentItem: FocusScope {

        anchors.fill: parent

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
