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

        ListView
        {
            id: selectionListView

            width: parent.width * 0.8
            height: selectionListView.contentHeight
            anchors.centerIn: parent
            spacing : 10

            boundsBehavior: Flickable.StopAtBounds

            model: selectionModel

            delegate: Column {

                id: selectionListDelegate

                property bool expanded: false

                spacing: 10

                Rectangle
                {
                    width: selectionListView.width
                    height: 50

                    Text
                    {
                        anchors.centerIn: parent
                        text: name /*from model*/
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            selectionListDelegate.expanded = !selectionListDelegate.expanded
                        }
                    }
                }

                GridLayout
                {
                    id: gridLayout

                      width: selectionListView.width
                      height: 0
                      columns: 5

                      property int availableSize: (gridLayout.width - (gridLayout.columnSpacing * (gridLayout.columns - 1)) ) / gridLayout.columns

                      property int rowsCount: Math.ceil(repeater.count / gridLayout.columns)

                      property int reqHeight: gridLayout.availableSize * gridLayout.rowsCount + (gridLayout.rowSpacing * (gridLayout.rowsCount - 1))

//                      visible: false

                      Repeater
                      {
                          id: repeater

                          model: 5 * ((index + 1) * 3)

                          Rectangle
                          {
                              id: rect
//                              Layout.minimumWidth: gridLayout.width * 0.25
                              Layout.preferredWidth: gridLayout.width * (100 / gridLayout.columns)
                              Layout.maximumWidth: gridLayout.width * (100 / gridLayout.columns)
                              Layout.fillWidth: true
                              Layout.preferredHeight: rect.width
                              Layout.fillHeight: true
//                              width: 50
//                              height: xxx.height / 3
                              color: "gray"
                          }
                      }
                }

                states:
                [
                    State
                    {
                        name: "Expanded"
                        when: selectionListDelegate.expanded
                    }
                ]
                transitions:
                [
                    Transition
                    {
                        from: ""
                        to: "Expanded"

                        PropertyAnimation
                        {
                            target: gridLayout
                            from: 0
                            to: gridLayout.reqHeight
                            properties: "height"
                            duration: 250
                        }
                    },
                    Transition
                    {
                        from: "Expanded"
                        to: ""

                        PropertyAnimation
                        {
                            target: gridLayout
                            from: gridLayout.reqHeight
                            to: 0
                            properties: "height"
                            duration: 250
                        }
                    }
                ]
            }
        }
    }

}
