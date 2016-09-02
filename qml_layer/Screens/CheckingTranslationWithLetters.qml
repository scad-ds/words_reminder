import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import "qrc:/qml_layer/Common" as Common
import "qrc:/qml_layer/SelectableComponents" as SelectableComponents

Common.MainLayout
{
	id: wrapper  

    leftHeaderButtonText: qsTr("Back")
    rightHeaderButtonText: qsTr("Quit")
    centralHeaderText: qsTr("CheckingTranslationWithLetters")

    contentItem:
    ColumnLayout
    {
        id: contentLayout

        property string targetWord: "targetWord"

        anchors.fill: parent

        Text
        {
            id: caption

            Layout.fillWidth: true
            Layout.minimumHeight: caption.contentHeight
            Layout.preferredHeight: caption.contentHeight + 40
            Layout.maximumHeight: caption.contentHeight + 40
            Layout.fillHeight: true
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignHCenter

            text: "Caption:"
        }

        Item
        {
            Layout.fillWidth: true
            Layout.minimumHeight: 100
            Layout.preferredHeight: 150
            Layout.maximumHeight: 150

            Rectangle
            {
                width: text1.implicitWidth + 30
                height: text1.implicitHeight + 30
                anchors.centerIn: parent
                color: "transparent"

                Text
                {
                    id: text1

                    anchors.centerIn: parent
                    font.pixelSize: 24
                    text: qsTr("<b>%1</b>").arg(contentLayout.targetWord)
                }
            }
        }

        Row
        {
            id: senderRow

            function senderFunc()
            {

            }

            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true

            spacing: 20

            Repeater
            {
                id: senderRepeater

                model: ListModel { //["a", "b", "c", "d", "e", "g"]
                    ListElement
                    {
                        name: "a"
                        position: 0
                    }
                    ListElement
                    {
                        name: "b"
                        position: 1
                    }
                    ListElement
                    {
                        name: "c"
                        position: 2
                    }
                    ListElement
                    {
                        name: "d"
                        position: 3
                    }
                    ListElement
                    {
                        name: "e"
                        position: 4
                    }
                }
                delegate: Rectangle {

                    id: senderDelegate

                    property bool isEmpty: name /**/ === ""

                    width: 50
                    height: 50
                    color: senderDelegate.isEmpty ? "transparent" : "blue"

                    Text
                    {
                        anchors.centerIn: parent
                        text: name /**/
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            if( !senderDelegate.isEmpty )
                            {
                                receiverRepeater.model.set(receiverRow.getFirstEmptyCellIndex(), senderRepeater.model.get(index))
                                senderRepeater.model.set(index, {"name": "", "position": -1})
                            }
                        }
                    }
                }
            }
        }

        Row
        {
            id: receiverRow

            function getFirstEmptyCellIndex()
            {
                for(var i = 0; i < receiverRepeater.model.count; i++)
                {
                    if(receiverRepeater.model.get(i).name === "")
                    {
                        return i
                    }
                }
                return -1
            }

            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true

            spacing: 20

            Repeater
            {
                id: receiverRepeater

                model: ListModel { //["a", "b", "c", "d", "e", "g"]
                    ListElement
                    {
                        name: ""
                        position: 0
                    }
                    ListElement
                    {
                        name: ""
                        position: 1
                    }
                    ListElement
                    {
                        name: ""
                        position: 2
                    }
                    ListElement
                    {
                        name: ""
                        position: 3
                    }
                    ListElement
                    {
                        name: ""
                        position: 4
                    }
                }
                delegate: Rectangle {

                    id: receiverDelegate

                    property bool isEmpty: name /**/ === ""

                    width: 50
                    height: 50
                    color: receiverDelegate.isEmpty ? "transparent" : "green"

                    Text
                    {
                        anchors.centerIn: parent
                        text: name /**/
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            if( !receiverDelegate.isEmpty )
                            {
                                senderRepeater.model.set(receiverRepeater.model.get(index).position, receiverRepeater.model.get(index))
                                receiverRepeater.model.set(index, {"name": "", "position": -1})
                            }
                        }
                    }
                }
            }
        }
    }
}
