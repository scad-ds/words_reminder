import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import "qrc:/qml_layer/Common" as Common
import "qrc:/qml_layer/SelectableComponents" as SelectableComponents

Common.MainLayout
{
    id: wrapper

    property var cardsModel: cardsListModel

    leftHeaderButtonText: qsTr("Back")
    rightHeaderButtonText: qsTr("Quit")
    centralHeaderText: qsTr("TranslationCardScreen")

    ListModel
    {
        id: cardsListModel

        function initModel()
        {
            for(var i = 0; i < 3; i++)
            {
                var item = {    "targetWord": "targetWord " + i,
                                "translatedWord": "translatedWord " + i,
                                "sentenceWithTargetWord": "sentenceWithTargetWord " + i,
                                "translatedSentence": "translatedSentence " + i
                           }
                cardsListModel.append(item)
            }
        }

        Component.onCompleted:
        {
            initModel()
        }

        ListElement
        {
            targetWord: "(to) work"
            translatedWord: "работать"
            sentenceWithTargetWord: "I need to <b>work</b>"
            translatedSentence: "Мне нужно <b>работать</b>"
        }
    }

    contentItem:
    SwipeView
    {
        id: contentView

        anchors.fill: parent
        currentIndex: 1

        background: Item
        {
            anchors.fill: parent

            Rectangle
            {
                width: 30
                height: 120
                color: "lightblue"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                visible: contentView.currentIndex != 0
            }

            Rectangle
            {
                width: 30
                height: 120
                color: "lightblue"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                visible: contentView.currentIndex != contentView.count - 1
            }
        }

        Repeater
        {
            model: wrapper.cardsModel

            FocusScope
            {
                id: conteinerItem

                ColumnLayout
                {
                    id: contentLayout

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

                            Text
                            {
                                id: text1

                                anchors.centerIn: parent
                                font.pixelSize: 24
                                text: qsTr("<b>%1</b>   -   <b>%2</b>").arg(targetWord /*From model*/).arg(translatedWord /*From model*/)
                            }
                        }
                    }

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
                            anchors.centerIn: parent
                            font.pixelSize: 24
                            text: sentenceWithTargetWord // From model
                        }
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
                            anchors.centerIn: parent
                            font.pixelSize: 24
                            text: translatedSentence // From model
                        }
                    }
                }
            }
       }

       Item
       {
           id: finalScreenContainer

           Column
           {
               spacing: 30
               anchors.centerIn: parent

               Rectangle
               {
                   width: finalScreenContainer.width / 2
                   height: 50
                   color: "blue"
                   MouseArea
                   {
                       anchors.fill: parent
                       onClicked:
                       {
                           contentView.currentIndex = 0
                       }
                   }
               }

               Rectangle
               {
                   width: finalScreenContainer.width / 2
                   height: 50
                   color: "blue"
                   MouseArea
                   {
                       anchors.fill: parent
                       onClicked:
                       {
                           contentView.currentIndex = 0
                       }
                   }
               }

               Rectangle
               {
                   width: finalScreenContainer.width / 2
                   height: 50
                   color: "blue"
                   MouseArea
                   {
                       anchors.fill: parent
                       onClicked:
                       {
                           contentView.currentIndex = 0
                       }
                   }
               }
           }
       }
    }
}
