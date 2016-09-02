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
            Layout.preferredHeight: caption.contentHeight + 40
            Layout.maximumHeight: caption.contentHeight + 40
            Layout.fillHeight: true
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignHCenter

            text: "Caption:"
        }

        Column
        {
            Layout.fillHeight: true
            Layout.fillWidth: true

            Row
            {
                id: matchingRow

                width: parent.width

                spacing: 20

                Column
                {
                    id: leftColumn

                    width: (matchingRow.width - matchingRow.spacing) / 2

                    spacing: 20

                    Repeater
                    {
                        model: ["aaaaa1", "bbbbb1", "ccccc1", "ddddd1", "eeeee1", "ggggg1", "jjjjj1"]
                        delegate: Rectangle
                        {
                            width: leftColumn.width
                            height: 60
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
                        model: ["aaaaa2", "bbbbb2", "ccccc2", "ddddd2", "eeeee2", "ggggg2", "jjjjj2"]
                        delegate: Rectangle
                        {
                            width: rigthColumn.width
                            height: 60
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

            FocusScope
            {
                width: parent.width
                height: 80

                Rectangle
                {
                    width: parent.width * 0.6
                    height: 60
                    anchors.centerIn: parent
                    color: "yellow"
                }
            }
        }
    }
}
