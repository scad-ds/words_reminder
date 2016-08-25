import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import "qrc:/qml_layer/Common" as Common
import "qrc:/qml_layer/SelectableComponents" as SelectableComponents

Common.MainLayout
{
	id: wrapper

    signal expressTranslationActivated()
    signal selectVariantsActivated()
    signal makeLettersActivated()

    leftHeaderButtonText: qsTr("Back")
    rightHeaderButtonText: qsTr("Quit")
    centralHeaderText: qsTr("SelectTranslationType")

    contentItem:
    ScrollView
    {
        id: scrollArea

        width: parent.width
        height: selectionListView.contentHeight < parent.height ? selectionListView.contentHeight : parent.height

        anchors.verticalCenter: parent.verticalCenter

        ListView
        {
            id: selectionListView

            model: ["Express transtalion", "Select from 6 variants", "Make from letters"]

            width: parent.width * 0.8
            height: selectionListView.contentHeight
            anchors.centerIn: parent
            spacing : 10

            boundsBehavior: Flickable.StopAtBounds

            delegate:
            SelectableComponents.SelectionModeListDelegate
            {
                id: listDelegate

                width: selectionListView.width
                height: 50
                contentText: modelData

                onClicked:
                {
                    switch(index)
                    {
                        case 0:
                            wrapper.expressTranslationActivated()
                            break
                        case 1:
                            wrapper.selectVariantsActivated()
                            break
                        case 2:
                            wrapper.makeLettersActivated()
                            break
                        default:
                            console.warn("Error")
                            break
                    }
                }
            }
        }
    }
}
