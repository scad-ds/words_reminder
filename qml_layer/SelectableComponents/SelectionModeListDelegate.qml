import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

FocusScope
{
    id: wrapper

    signal clicked()

    property alias contentText: textItem.text

    Rectangle
    {
        id: listItem

        width: wrapper.width
        height: 50
        color: "white"

        Text
        {
            id: textItem

            anchors.centerIn: parent
            text: wrapper.contentText
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                wrapper.clicked()
            }
        }
    }
}
