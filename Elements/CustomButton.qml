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
    readonly property alias pressed: btnMouse.pressed

    height: 70
    width: 200


    signal clicked()

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

        color:{
            if (btnMouse.containsMouse){
                if(btnMouse.pressed){
                    return buttonColorPressed
                }
                else{
                    return  colorAnim.start()
                }
            }
            else{
                return unhoverAnim.start()
            }
        }


        //color: btnMouse.containsMouse ? (btnMouse.pressed ? buttonColorPressed : colorAnim.start()) : buttonColor

        border.color: btnMouse.containsMouse ? (btnMouse.pressed ? buttonColor : buttonColorPressed) : buttonColorHover

        radius: 16

        PropertyAnimation{

            id: colorAnim;
            target: btnRectangle;
            property: "color";
            from: btn.buttonColor;
            to: btn.buttonColorHover;
            duration: 300
        }

        PropertyAnimation{

            id: unhoverAnim;
            target: btnRectangle;
            property: "color";
            from: btn.color;
            to: btn.buttonColor;
            duration: 300
        }


        Row{

            anchors.fill: parent
            spacing: 10
            leftPadding: 12


            Image{

                id: imageIcon

                width: 47
                height: 47

                source: imageUrl

                anchors.verticalCenter: parent.verticalCenter
            }


            Text{
                id: btnText

                anchors.verticalCenter: parent.verticalCenter

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
