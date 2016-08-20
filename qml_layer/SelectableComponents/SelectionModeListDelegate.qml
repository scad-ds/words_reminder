import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

Column
{
    id: wrapper

    signal clicked()

    spacing: 10

    Rectangle
    {
        id: listItem

        width: wrapper.width
        height: 50

        Text
        {
            anchors.centerIn: parent
            text: name /*from model*/
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
