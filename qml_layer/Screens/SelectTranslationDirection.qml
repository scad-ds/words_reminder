import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import "qrc:/qml_layer/Common" as Common
import "qrc:/qml_layer/SelectableComponents" as SelectableComponents

Common.MainLayout
{
	id: wrapper

    signal learnSelected()
    signal rusToEngSelected()
    signal engToRusSelected()
    signal mixingSelected()

    leftHeaderButtonText: qsTr("Back")
    rightHeaderButtonText: qsTr("Quit")
    centralHeaderText: qsTr("SelectTranslationDirection")

    contentItem:
    FocusScope
    {
        anchors.fill: parent

        Column
        {
            width: parent.width
            anchors.centerIn: parent
            spacing: 10

            SelectableComponents.SelectionModeListDelegate
            {
                width: parent.width
                height: 50

                contentText: qsTr("Learn")

                onClicked:
                {
                    wrapper.learnSelected()
                }
            }

            Column
            {
                id: checkRow

                property bool expanded: false

                width: parent.width

                SelectableComponents.SelectionModeListDelegate
                {
                    id: checkListItem

                    width: parent.width
                    height: 50

                    contentText: qsTr("Check")

                    onClicked:
                    {
                        checkRow.expanded = !checkRow.expanded
                    }
                }

                RowLayout
                {
                    id: directionRow

                    property int availableSize: (directionRow.width - (2 /**/ * directionRow.spacing) ) / 3 /**/

                    width: parent.width
                    height: 0
                    clip: true

                    Rectangle
                    {
                        Layout.minimumWidth: directionRow.availableSize
                        Layout.preferredWidth: directionRow.availableSize
                        Layout.maximumWidth: directionRow.availableSize
                        Layout.fillHeight: true

                        color: "brown"

                        Text
                        {
                            anchors.centerIn: parent
                            text: qsTr("Eng to Rus")
                        }

                        MouseArea
                        {
                            anchors.fill: parent

                            onClicked:
                            {
                                wrapper.engToRusSelected()
                            }
                        }
                    }

                    Rectangle
                    {
                        Layout.minimumWidth: directionRow.availableSize
                        Layout.preferredWidth: directionRow.availableSize
                        Layout.maximumWidth: directionRow.availableSize
                        Layout.fillHeight: true

                        color: "brown"

                        Text
                        {
                            anchors.centerIn: parent
                            text: qsTr("Rus to Eng")
                        }

                        MouseArea
                        {
                            anchors.fill: parent

                            onClicked:
                            {
                                wrapper.rusToEngSelected()
                            }
                        }
                    }

                    Rectangle
                    {
                        Layout.minimumWidth: directionRow.availableSize
                        Layout.preferredWidth: directionRow.availableSize
                        Layout.maximumWidth: directionRow.availableSize
                        Layout.fillHeight: true

                        color: "brown"

                        Text
                        {
                            anchors.centerIn: parent
                            text: qsTr("Mixing")
                        }

                        MouseArea
                        {
                            anchors.fill: parent

                            onClicked:
                            {
                                wrapper.mixingSelected()
                            }
                        }
                    }
                }

                states:
                [
                    State
                    {
                        name: "Expanded"
                        when: checkRow.expanded
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
                            target: directionRow
                            from: 0
                            to: directionRow.availableSize
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
                            target: directionRow
                            from: directionRow.availableSize
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
