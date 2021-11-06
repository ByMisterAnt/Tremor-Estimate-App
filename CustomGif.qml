import QtQuick 2.0

Item {
    property url gif_path: gif_path
    property color govno: govno
    MouseArea{

        width: parent.width
        height: parent.height

        hoverEnabled: true

        AnimatedImage {

            width: parent.width
            height: parent.height

            source: gif_path
            playing: parent.containsMouse? true : false
        }
    }
}

