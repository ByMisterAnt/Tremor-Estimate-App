import QtQuick 2.15
import QtGraphicalEffects 1.0

Item {
    id: btn

    property string buttonText: buttonText
    property color buttonTextColor: buttonTextColor
    property color buttonColorPressed: buttonColorPressed
    property color buttonColorHover: buttonColorHover
    property color buttonColor: buttonColor
    property url imageUrl: imageUrl

    height: 70
    width: 200


    DropShadow{
        anchors.fill: btnRectangle
        horizontalOffset: 2
        verticalOffset: 2
        radius: 9
        samples: 15
        source: btnRectangle
        color: "black"
        }

    Rectangle{
        id: btnRectangle

        anchors.fill: parent

        color: btnMouse.containsMouse ? (btnMouse.pressed ? buttonColorPressed : buttonColorHover) : buttonColor

        border.color: btnMouse.containsMouse ? (btnMouse.pressed ? buttonColor : buttonColorPressed) : buttonColorHover
        radius: 16


        Row{

            anchors.fill: parent
            spacing: 10
            leftPadding: 12


            Image{
                id: imageIcon
                source: imageUrl

                anchors.verticalCenter: parent.verticalCenter
                //anchors.left: parent.left
                //anchors.leftMargin: 10


                width: 47
                height: 47
            }


            Text{
                id: btnText

                anchors.verticalCenter: parent.verticalCenter
                //anchors.left: imageIcon.right


                text: buttonText

                font.family: "Roboto"

                color: buttonTextColor
                font { bold: true; pixelSize: 22 }
            }

        }

        MouseArea {
            id: btnMouse

            anchors.fill: parent

            hoverEnabled: true
            onClicked: btn.clicked()
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:2}
}
##^##*/
