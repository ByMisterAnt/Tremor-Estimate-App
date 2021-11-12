import QtQuick 2.15
import QtCharts 2.15

Item {

    property string chartTitle: chartTitle
    property double zom: 1

    ChartView {
        id: chartView

        anchors.fill: parent

        title: chartTitle
        titleFont: Qt.font({pointSize: 15, bold: true});

        legend.font.pointSize: 15
        legend.markerShape: Legend.MarkerShapeCircle

        antialiasing: true


        ValueAxis{
            id: valueAxisY
            gridLineColor: "black"
            titleText: "Значение ошибки"
            titleFont: Qt.font({pointSize: 15, bold: true});
            min: 0
            max: 2
            labelsFont.pointSize: 15
        }

        ValueAxis{
            id: valueAxisX
            titleText: "Время"
            titleFont: Qt.font({pointSize: 15, bold: true});
            min: 0
            max: 50
            labelsFont.pointSize: 15
            gridLineColor: "black"
        }

        LineSeries {
            id: seriesX
            color: "blue"
            name: "По оси X"
            axisX: valueAxisX
            axisY: valueAxisY
            width: 3

        }

        LineSeries {
            id: seriesY
            color: "green"
            name: "По оси Y"
            axisX: valueAxisX
            axisY: valueAxisY
            width: 3
        }

        LineSeries {
            id: seriesNormal
            color: "red"
            name: "Норма"
            width: 3
        }


        MouseArea{
            anchors.fill: parent
            onDoubleClicked: resetChart()

            onWheel: {
                chartView.zoomReset();
                if (wheel.angleDelta.y > 0)
                {
                    zom -= 0.2
                }
                else if (wheel.angleDelta.y < 0)
                {
                    zom += 0.2
                }
                if (zom <= 0){
                    zom = 0.1
                }
                else if(zom >= 10){
                        zom = 10
                    }

                var center_x = wheel.x
                var center_y = wheel.y
                var width_zoom = 50*zom;
                var height_zoom = 50*zom;
                var r = Qt.rect(center_x-width_zoom/2, center_y - height_zoom/2, width_zoom, height_zoom)
                chartView.zoomIn(r)
                console.log(wheel.angleDelta.y, zom)
            }

        }
    }

    function resetChart(){
        chartView.zoomReset();
        zom = 1;
    }

    Component.onCompleted: {
        for (var i = 0; i <= 50; i++) {
            seriesY.append(i, Math.random() + Math.random());
            seriesX.append(i, Math.random() + Math.random());
            seriesX.append(i, Math.random() + Math.random());
            seriesNormal.append(i, 0.5)
        }
    }
}
