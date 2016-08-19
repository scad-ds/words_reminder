import QtQuick 2.7
import "qrc:/qml_layer/skin_styles/" as Styles

QtObject
{
    id: obj

    property alias main                    : textEditStyle

    property var __mainStyle:
    TextEditStyle
    {
        id: mainStyle
    }
}
