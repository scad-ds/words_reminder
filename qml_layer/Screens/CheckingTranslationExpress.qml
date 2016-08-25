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
    centralHeaderText: qsTr("CheckingTranslationExpress")

    contentItem:
    ColumnLayout
    {
        id: contentLayout

        anchors.fill: parent

        Text
        {
            id: caption

            Layout.fillWidth: true
            Layout.minimumHeight: caption.contentHeight
            Layout.fillHeight: true

            text: "BlaBlaCaption"
        }

        Row
        {
            id: matchingRow

            Layout.fillHeight: true
            Layout.fillWidth: true

            spacing: 20

            Column
            {
                id: leftColumn

                width: (matchingRow.width - matchingRow.spacing) / 2

                spacing: 20

                Repeater
                {
                    model: ["aaaaa1", "bbbbb1", "ccccc1"]
                    delegate: Rectangle
                    {
                        width: leftColumn.width
                        height: 50
                        color: "green"

                        Text
                        {
                            anchors.centerIn: parent
                            text: modelData
                        }
                    }
                }
            }

            Column
            {
                id: rigthColumn

                width: (matchingRow.width - matchingRow.spacing) / 2

                spacing: 20

                Repeater
                {
                    model: ["aaaaa2", "bbbbb2", "ccccc2"]
                    delegate: Rectangle
                    {
                        width: rigthColumn.width
                        height: 50
                        color: "magenta"

                        Text
                        {
                            anchors.centerIn: parent
                            text: modelData
                        }
                    }
                }
            }
        }
    }
}
