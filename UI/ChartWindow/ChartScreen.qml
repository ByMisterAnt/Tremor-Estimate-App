import QtQuick 2.15
import QtQuick.Controls 1.1
import  "../../Elements"

Item {

    id: chartWindow

    CustomButton {
        id: buttonSave

        x: 20
        y: 20

        buttonColorPressed: "#1163ae"
        buttonColorHover: "#136ec1"
        buttonColor: "#0085FF"
        buttonTextColor: "white"

        imageUrl: "qrc:/Images/save_icon.png"
        buttonText: "Сохранить"

    }

    CustomButton {
        id: buttonClear

        x: 300
        y: 20

        buttonColorPressed: "#1163ae"
        buttonColorHover: "#136ec1"
        buttonColor: "#0085FF"
        buttonTextColor: "white"

        imageUrl: "qrc:/Images/close_icon.png"
        buttonText: "Очистить"
    }

    CustomButton {
        id: buttonSaveText

        x: 600
        y: 20

        buttonColorPressed: "#1163ae"
        buttonColorHover: "#136ec1"
        buttonColor: "#0085FF"
        buttonTextColor: "white"

        imageUrl: "qrc:/Images/write_icon.png"
        buttonText: "Записать"

    }

    CustomButton {
        id: buttonMainMenu

        x: 1000
        y: 20

        buttonColorPressed: "#72ffc0"
        buttonColorHover: "#b5ffde"
        buttonColor: "#d8feed"
        buttonTextColor: "green"

        imageUrl: "qrc:/Images/arrow_icon.png"
        buttonText: "В начало"
    }
}
