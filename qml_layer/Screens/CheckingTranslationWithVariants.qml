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
    centralHeaderText: qsTr("CheckingTranslationWithVariants")

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

        Column
        {
            Layout.fillHeight: true
            Layout.fillWidth: true

            Row
            {
                id: columnsRow

                width: parent.width

                spacing: 20

                Column
                {
                    id: leftColumn

                    width: (columnsRow.width - columnsRow.spacing) / 2

                    spacing: 20

                    Repeater
                    {
                        model: ["aaaaa1", "bbbbb1", "ccccc1"]
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

                    width: (columnsRow.width - columnsRow.spacing) / 2

                    spacing: 20

                    Repeater
                    {
                        model: ["aaaaa2", "bbbbb2", "ccccc2"]
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
        }
    }
}
