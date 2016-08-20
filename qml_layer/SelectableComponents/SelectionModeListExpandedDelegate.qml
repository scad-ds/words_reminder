import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

Column
{
    id: wrapper

    signal subcategoryActivated(int activatedIndex)

    property alias model: subcategoriesRepeater.model
    property bool expanded: false

    spacing: 10

    Rectangle
    {
        id: categoryListItem

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
                wrapper.expanded = !wrapper.expanded
            }
        }
    }

    GridLayout
    {

        id: subcategoriesLayout

        width: wrapper.width
        height: 0
        columns: 5
        clip: true

        property int availableCellSize: (subcategoriesLayout.width - (subcategoriesLayout.columnSpacing * (subcategoriesLayout.columns - 1)) ) / subcategoriesLayout.columns
        property int rowsCount: Math.ceil(subcategoriesRepeater.count / subcategoriesLayout.columns)
        property int requiredLayoutHeight: subcategoriesLayout.availableCellSize * subcategoriesLayout.rowsCount + (subcategoriesLayout.rowSpacing * (subcategoriesLayout.rowsCount - 1))

        Repeater
        {
            id: subcategoriesRepeater

            Rectangle
            {
                id: rect

                Layout.preferredWidth: subcategoriesLayout.width * (100 / subcategoriesLayout.columns)
                Layout.maximumWidth: subcategoriesLayout.width * (100 / subcategoriesLayout.columns)
                Layout.fillWidth: true
                Layout.preferredHeight: rect.width
                Layout.fillHeight: true

                color: "gray"

                Text
                {
                    anchors.centerIn: parent
                    text: index /*attached propery*/
                }

                MouseArea
                {
                    anchors.fill: parent

                    onClicked:
                    {
                        wrapper.subcategoryActivated(index /*attached propery*/)
                    }
                }
            }
        }
    }

    states:
    [
        State
        {
            name: "Expanded"
            when: wrapper.expanded
        }
    ]

    transitions:
    [
        Transition
        {
            from: ""
            to: "Expanded"

            PropertyAnimation
            {
                target: subcategoriesLayout
                from: 0
                to: subcategoriesLayout.requiredLayoutHeight
                properties: "height"
                duration: 250
            }
        },
        Transition
        {
            from: "Expanded"
            to: ""

            PropertyAnimation
            {
                target: subcategoriesLayout
                from: subcategoriesLayout.requiredLayoutHeight
                to: 0
                properties: "height"
                duration: 250
            }
        }
    ]
}
