import QtQuick 2.15
import QtGraphicalEffects 1.0

Item {

    property url imageUrl_blue: imageUrl_blue
    property string buttonText_blue: buttonText_blue

    CustomButton {

        buttonColorPressed: "#1163ae"
        buttonColorHover: "#136ec1"
        buttonColor: "#0085FF"


        imageUrl: imageUrl_blue

        buttonText: buttonText_blue
        buttonTextColor: "white"
    }
}
