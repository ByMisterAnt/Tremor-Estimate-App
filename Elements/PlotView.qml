import QtQuick 2.15
import CustomPlot 1.0

Item {
    id: plotForm

    Text {
        id: text
        text: qsTr("Plot form")
    }

    CustomPlotItem {
        id: customPlot
        anchors.fill: parent

        Component.onCompleted: initCustomPlot()
    }
}
