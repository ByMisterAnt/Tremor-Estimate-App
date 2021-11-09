import QtQuick 2.15
import QtCharts 2.15

Item {

    property string chartTitle: chartTitle


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
            onDoubleClicked: chartView.zoomReset();
            onClicked: {
               //capturer.save(img)
            }

            onWheel: {
                chartView.zoomReset();
                var center_x = wheel.y
                var center_y = wheel.y
                var width_zoom = height/wheel.y;
                var height_zoom = width/wheel.y;
                var r = Qt.rect(center_x-width_zoom/2, center_y - height_zoom/2, width_zoom, height_zoom)
                chartView.zoomIn(r)
            }


        }

        PinchArea{
            id: pa
            anchors.fill: parent
            onPinchUpdated: {
                chartView.zoomReset();
                var center_x = pinch.center.x
                var center_y = pinch.center.y
                var width_zoom = height/pinch.scale;
                var height_zoom = width/pinch.scale;
                var r = Qt.rect(center_x-width_zoom/2, center_y - height_zoom/2, width_zoom, height_zoom)
                chartView.zoomIn(r)
            }
        }
    }



    Component.onCompleted: {
        for (var i = 0; i <= 50; i++) {
            seriesY.append(i, Math.random());
            seriesX.append(i, Math.random());
            seriesX.append(i, Math.random());
            seriesNormal.append(i, 0.5)
        }
    }
}


//------------------------------------------------------------------------------------------------------------------------
//        LineSeries {
//            name: "LineSeries"
//            axisX: [0, 1.5, 1.59, 2.16, 2.91, 3.42, 4.13];
//            axisY: [0, 2, 3, 2, 5, 3, 3.3]
//                //XYPoint { x: [0, 1, 2]; y: [0,1,99] }
//        }

/*
    MouseArea{
        anchors.fill: parent
        onDoubleClicked: chartView.zoomReset();
        onClicked: {
           //capturer.save(img)
        }

        onWheel: {
            chartView.zoomReset();
            var center_x = wheel.y
            var center_y = wheel.y
            var width_zoom = height/wheel.y;
            var height_zoom = width/wheel.y;
            var r = Qt.rect(center_x-width_zoom/2, center_y - height_zoom/2, width_zoom, height_zoom)
            chartView.zoomIn(r)
        }


    }

    PinchArea{
        id: pa
        anchors.fill: parent
        onPinchUpdated: {
            chartView.zoomReset();
            var center_x = pinch.center.x
            var center_y = pinch.center.y
            var width_zoom = height/pinch.scale;
            var height_zoom = width/pinch.scale;
            var r = Qt.rect(center_x-width_zoom/2, center_y - height_zoom/2, width_zoom, height_zoom)
            chartView.zoomIn(r)
        }
    }
*/
