import QtQuick 2.15
import QtQuick.Controls 1.1
import  "../../Elements"

Item {

    id: chartWindow

    BlueBtn {
        id: buttonSave

        x: 20
        y: 20

        imageUrl_blue: "qrc:/Images/save_icon.png"
        buttonText_blue: "Сохранить"

    }

    BlueBtn {
        id: buttonClear

        x: 300
        y: 20

        imageUrl_blue: "qrc:/Images/close_icon.png"
        buttonText_blue: "Очистить"
    }

    BlueBtn {
        id: buttonSaveText

        x: 600
        y: 20

        imageUrl_blue: "qrc:/Images/write_icon.png"
        buttonText_blue: "Записать"

    }

    GreenBtn {
        id: buttonMainMenu

        x: 1000
        y: 20

        imageUrl_green: "qrc:/Images/arrow_icon.png"
        buttonText_green: "В начало"
    }
}