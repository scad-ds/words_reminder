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
    centralHeaderText: qsTr("TranslationCardScreen")

    contentItem:
    FocusScope
    {
        anchors.fill: parent

        ColumnLayout
        {
            id: contentLayout

            property string targetWord: "(to) work"
            property string translatedWord: "работать"

            anchors.fill: parent

            Item
            {
                Layout.fillWidth: true
                Layout.minimumHeight: 100
                Layout.preferredHeight: 100
                Layout.maximumHeight: 100

                Layout.topMargin: contentLayout.height * 0.1

                Rectangle
                {
                    width: text1.implicitWidth + 30
                    height: text1.implicitHeight + 30
                    anchors.centerIn: parent
                    color: "transparent"
//                    border.width: 2
//                    border.color: "black"

                    Text
                    {
                        id: text1

                        anchors.centerIn: parent
                        font.pixelSize: 24
                        text: qsTr("<b>%1</b>   -   <b>%2</b>").arg(contentLayout.targetWord).arg(contentLayout.translatedWord)
                    }
                }
            }


//            Row//Layout
//            {
//                Layout.fillWidth: true
//                Layout.minimumHeight: 100
//                Layout.preferredHeight: 100
//                Layout.maximumHeight: 100

//                Layout.topMargin: contentLayout.height * 0.1

//                Item
//                {
//                    width: parent.width * 0.4
//                    height: parent.height

//                    Rectangle
//                    {
//                        width: text1.implicitWidth + 30
//                        height: text1.implicitHeight + 30
//                        anchors.centerIn: parent
//                        color: "transparent"
//                        border.width: 2
//                        border.color: "black"

//                        Text
//                        {
//                            id: text1

//                            anchors.centerIn: parent
//                            font.pixelSize: 24
//                            text: "(to) work"
//                        }
//                    }
//                }

//                Item
//                {
//                    width: parent.width * 0.2
//                    height: parent.height

//                    Text
//                    {
//                        verticalAlignment: Text.AlignVCenter
//                        horizontalAlignment: Text.AlignHCenter

//                        anchors.centerIn: parent
//                        font.pixelSize: 24

//                        text: " - "
//                    }
//                }

//                Item
//                {
//                    width: parent.width * 0.4
//                    height: parent.height

//                    Rectangle
//                    {
//                        width: text2.implicitWidth + 30
//                        height: text2.implicitHeight + 30
//                        anchors.centerIn: parent

//                        color: "transparent"
//                        border.width: 2
//                        border.color: "black"

//                        Text
//                        {
//                            id: text2
//                            anchors.centerIn: parent
//                            font.pixelSize: 24
//                            text: "работать"
//                        }
//                    }
//                }
//            }

            Item
            {
                Layout.fillWidth: true

                Layout.minimumHeight: 200
                Layout.fillHeight: true

                Rectangle
                {
                    height: 200
                    width: 200
                    anchors.centerIn: parent

                    color: "gray"
                }
            }

            Item
            {
                Layout.fillWidth: true
                Layout.minimumHeight: 70
                Layout.preferredHeight: 70
                Layout.maximumHeight: 70

                Text
                {
//                    anchors.verticalCenter: parent.verticalCenter
                    anchors.centerIn: parent
                    font.pixelSize: 24
                    text: "I need to <b>work</b>"
                }

//                color: "blue"
            }

            Item
            {
                Layout.fillWidth: true
                Layout.minimumHeight: 70
                Layout.preferredHeight: 70
                Layout.maximumHeight: 70

                Layout.bottomMargin: contentLayout.height * 0.1

                Text
                {
//                    anchors.verticalCenter: parent.verticalCenter
                    anchors.centerIn: parent
                    font.pixelSize: 24
                    text: "Мне нужно <b>работать</b>"
                }


//                color: "yellow"
            }
        }
    }
}
