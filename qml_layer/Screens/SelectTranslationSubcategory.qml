import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import "qrc:/qml_layer/Common" as Common
import "qrc:/qml_layer/SelectableComponents" as SelectableComponents

Common.MainLayout
{
    id: wrapper

    signal partActivated(int sucategoryIndex, int partIndex)

    property string categoryName: ""
    property alias subcategoties: selectionListView.model

    leftHeaderButtonText: qsTr("Back")
    rightHeaderButtonText: qsTr("Quit")
    centralHeaderText: qsTr("SelectTranslationSubcategory")

    contentItem:
    FocusScope
    {
        anchors.fill: parent

        ScrollView
        {
            id: scrollArea

            width: parent.width
            height: selectionListView.contentHeight < parent.height ? selectionListView.contentHeight : parent.height

            anchors.verticalCenter: parent.verticalCenter

            ListView
            {
                id: selectionListView

                width: parent.width * 0.8
                height: selectionListView.contentHeight
                anchors.centerIn: parent
                spacing : 10

                boundsBehavior: Flickable.StopAtBounds

                delegate:
                SelectableComponents.SelectionModeListExpandedDelegate
                {
                    width: selectionListView.width
                    model: wrapper.subcategoties.createPartsModel(index)

                    onSubcategoryActivated:
                    {
                        wrapper.partActivated(index /*attached propery*/, activatedIndex /*From signal*/)
                    }
                }
            }
        }
    }

}
