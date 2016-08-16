import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

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

                Grid
                {
                    id: xxx

                      width: selectionListView.width
                      height: 0
                      columns: 3
                      spacing: 15

//                      visible: false

                      Repeater
                      {
                          model: 5

                          Rectangle
                          {
                              width: 50
                              height: xxx.height / 3
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

                        PropertyChanges
                        {
                            target: xxx
//                            visible: true
                        }
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
                            target: xxx
                            from: 0
                            to: 150
                            properties: "height"
                            duration: 500
                        }
                    },
                    Transition
                    {
                        from: "Expanded"
                        to: ""

                        PropertyAnimation
                        {
                            target: xxx
                            from: 150
                            to: 0
                            properties: "height"
                            duration: 500
                        }
                    }
                ]
            }
        }
    }

}
