import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

import "Elements"

import "UI/ChartWindow"
import "UI/MainWindow"
import "UI/CameraWindow"


Window {

    id: mainWindow

    width: 1280
    height: 720

    visible: true

    title: qsTr("TEA alpha 2.0")

    property url filePathForPlot: "./tremor.txt"

    Loader
    {
        id: mainLoader

        anchors.fill: parent

        source: "qrc:/UI/MainWindow/MainScreen.qml"
    }
}
