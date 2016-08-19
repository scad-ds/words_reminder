import QtQuick 2.7

QtObject
{
    id: obj

    property alias textEdit                    : textEditStyle

    property var __textEditStyle:
    TextEditStyle
    {
        id: textEditStyle
    }
}
