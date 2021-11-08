import QtQuick 2.15
import QtGraphicalEffects 1.0

Item {

    property color bgColor: bgColor

    Rectangle {

        id: areaRect
        anchors.fill: parent

        radius: 26
        color: bgColor
    }

    DropShadow{
        anchors.fill: areaRect
        horizontalOffset: 2
        verticalOffset: 2
        radius: 9
        samples: 15
        source: areaRect
        color: "black"
        }
}
