import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Button{
    property color background_color: background_color
    property color border_color: border_color
    property color text_color: text_color
    property string button_text: button_text
    property real border_radius: border_radius

    background: Rectangle{

        color: background_color
        width: parent.width
        height: parent.height
        border { color: border_color; width: 1 }
        radius: border_radius
    }

    contentItem: Text {

        color: text_color
        text: qsTr(button_text)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

}
