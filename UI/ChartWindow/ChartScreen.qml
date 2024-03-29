import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtCharts 2.15
import  "../../Elements"

Item
{
    id: chartWindow

    property string file_path: file_path

    width: 1280
    height: 720

    Rectangle
    {

        id: backSide

        anchors.fill: parent

        color: "#EFF7FF"

        RowLayout
        {

            anchors.fill: parent
            anchors.topMargin: 38
            anchors.bottomMargin: 38
            anchors.leftMargin: 38
            anchors.rightMargin: 38

            spacing: 40

            ContentArea
            {
                id: leftArea

                Layout.fillHeight: true
                Layout.fillWidth: true

                bgColor: "white"

                ColumnLayout
                {
                    anchors.fill: parent

                    /*CustomSplineChart
                    {

                        id: tremorChart

                        Layout.margins: 40
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        chartTitle: "График тремора"
                    }*/
                    PlotView
                    {
                        id: tremorChart

                        Layout.margins: 40
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    RowLayout
                    {

                        Layout.bottomMargin: 40
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        spacing: parent.width < 580 ? 10 : parent.width/4

                        CustomButton
                        {
                            id: buttonMainMenu

                            x: 1000
                            y: 20

                            buttonColorPressed: "#72ffc0"
                            buttonColorHover: "#b5ffde"
                            buttonColor: "#d8feed"
                            buttonTextColor: "green"

                            imageUrl: "qrc:/Images/arrow_icon.png"
                            buttonText: "В начало"

                            onClicked: mainLoader.source = "qrc:/UI/MainWindow/MainScreen.qml"
                        }

                        CustomButton
                        {

                            id: buttonSave

                            buttonColorPressed: "#1163ae"
                            buttonColorHover: "#136ec1"
                            buttonColor: "#0085FF"
                            buttonTextColor: "white"

                            imageUrl: "qrc:/Images/save_icon.png"
                            buttonText: "Сохранить"

                            onClicked: saveElementImg(tremorChart)

                        }
                    }
                }
            }

            ContentArea
            {

                id: rightArea

                Layout.fillHeight: true
                Layout.fillWidth: true

                bgColor: "white"

                ColumnLayout
                {

                    anchors.fill: parent

                    ScrollView
                    {

                        id: scrollView

                        clip: true

                        Layout.margins: 40
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        CustomTextArea
                        {

                            id: textComment

                            width: scrollView.width - 30

                            value: "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
                        }
                    }

                    RowLayout
                    {

                        Layout.bottomMargin: 40
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        spacing: parent.width < 580 ? 10 : parent.width/4

                        CustomButton
                        {
                            id: buttonSaveText

                            buttonColorPressed: "#1163ae"
                            buttonColorHover: "#136ec1"
                            buttonColor: "#0085FF"
                            buttonTextColor: "white"

                            imageUrl: "qrc:/Images/write_icon.png"
                            buttonText: "Записать"

                            onClicked: app.writeTextToFile(textComment.value, "txt")
                        }

                        CustomButton
                        {

                            id: buttonClear

                            buttonColorPressed: "#1163ae"
                            buttonColorHover: "#136ec1"
                            buttonColor: "#0085FF"
                            buttonTextColor: "white"

                            imageUrl: "qrc:/Images/close_icon.png"
                            buttonText: "Очистить"

                            onClicked:  textComment.value = "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
                        }
                    }
                }
            }
        }
    }

    Connections
    {
        target: app
    }


    function saveElementImg(elementId)
    {

        file_path = app.choosePath("img")

        elementId.grabToImage(function(result) { result.saveToFile(file_path); });
    }
}
