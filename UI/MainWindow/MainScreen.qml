import QtQuick 2.15
import QtQuick.Controls 1.1
import  "../../Elements"

Item {

    id: mainWindow

        Button {
            id: btnMouse

            x: 100
            y: 100

            width: 100
            height: 100

            text: "to chart"
            onClicked: mainLoader.source = "qrc:/UI/ChartWindow/ChartScreen.qml"
        }
}

