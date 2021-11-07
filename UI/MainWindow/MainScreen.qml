import QtQuick 2.15
import QtQuick.Controls 1.1
import  "../../Elements"

Item {

    function setBLM(what){
        console.log(what)
    }

    id: mainWindow

        CustomButton {
            id: btnMouse

            x: 100
            y: 100

            buttonColorPressed: "#1163ae"
            buttonColorHover: "#136ec1"
            buttonColor: "#0085FF"

            imageUrl: "qrc:/Images/arrow_icon.png"
            buttonText: "Сохранить"

            buttonTextColor: "white"

            onClicked: mainLoader.source = "qrc:/UI/ChartWindow/ChartScreen.qml"
        }




        CustomButton {
            id: btnMouse2

            x: 200
            y: 200

            buttonColorPressed: "#72ffc0"
            buttonColorHover: "#b5ffde"
            buttonColor: "#d8feed"

            imageUrl: "qrc:/Images/save_icon.png"
            buttonText: "В начало"

            buttonTextColor: "green"

            onClicked: console.log("назад")
        }


}

