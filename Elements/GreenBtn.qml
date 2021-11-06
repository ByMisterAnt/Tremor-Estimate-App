import QtQuick 2.15
import QtGraphicalEffects 1.0

Item {

    property url imageUrl_green: imageUrl_green
    property string buttonText_green: buttonText_green

    CustomButton {

        buttonColorPressed: "#72ffc0"
        buttonColorHover: "#b5ffde"
        buttonColor: "#d8feed"

        imageUrl: imageUrl_green

        buttonText: buttonText_green
        buttonTextColor: "green"
    }
}
