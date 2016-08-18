import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

MainLayout
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

    contentItem: FocusScope {

        anchors.fill: parent

        ScrollView
        {
            id: scrollArea

            width: parent.width
            height: selectionListView.contentHeight < parent.height ? selectionListView.contentHeight : parent.height

            anchors.verticalCenter: parent.verticalCenter

            ListView
            {
                id: selectionListView

                width: parent.width * 0.8
                height: selectionListView.contentHeight
                anchors.centerIn: parent
                spacing : 10

                boundsBehavior: Flickable.StopAtBounds

                model: selectionModel

                delegate:
                SelectionModeListDelegate {
                    id: dlg

                    width: selectionListView.width
                    subcategoriesModel: 5 * ((index + 1) * 3)
                }
            }
        }
    }

}
