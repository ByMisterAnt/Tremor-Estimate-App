import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 1.1

import  "Elements"

import "UI/ChartWindow"
import "UI/MainWindow"
import "UI/CameraWindow"


Window {
    width: 1280
    height: 720
    visible: true
    title: qsTr("TEA alpha 0.1")

    Loader {
            id: mainLoader
            anchors.fill: parent
            source: "qrc:/UI/MainWindow/MainScreen.qml"
        }

}
