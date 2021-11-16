import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

import  "Elements"

import "UI/ChartWindow"
import "UI/MainWindow"
import "UI/CameraWindow"


Window {

    id: mainWindow

    width: 1280
    height: 720
    visible: true

    //visibility: Window.FullScreen
    title: qsTr("TEA alpha 1.0")

    property url filePathForPlot: "./tremor.txt"

    Loader {
            id: mainLoader
            anchors.fill: parent
            source: "qrc:/UI/MainWindow/MainScreen.qml"
        }
//    Item{
//        anchors.fill: parent
//    PlotView {
//        anchors.fill: parent

//            }
//            }

}
