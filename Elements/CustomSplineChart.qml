import QtQuick 2.15
import QtCharts 2.3

Item {

    ChartView {
        id: chartView
        anchors.fill: parent

        LineSeries {
            name: "LineSeries"
            XYPoint { x: 0; y: 0 }
            XYPoint { x: 1.1; y: 2.1 }
            XYPoint { x: 1.9; y: 3.3 }
            XYPoint { x: 2.1; y: 2.1 }
            XYPoint { x: 2.9; y: 4.9 }
            XYPoint { x: 3.4; y: 3.0 }
            XYPoint { x: 4.1; y: 3.3 }
        }

        LineSeries {
            name: "LineSeries1"
            XYPoint { x: 0; y: 0 }
            XYPoint { x: 1.5; y: 2.1 }
            XYPoint { x: 1.59; y: 3.3 }
            XYPoint { x: 2.16; y: 2.1 }
            XYPoint { x: 2.91; y: 4.9 }
            XYPoint { x: 3.42; y: 3.0 }
            XYPoint { x: 4.13; y: 3.3 }
        }
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
    }
}
