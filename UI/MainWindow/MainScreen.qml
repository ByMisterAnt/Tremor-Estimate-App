import QtQuick 2.15
import QtQuick.Layouts 1.1

import  "../../Elements"

Item
{

    id: mainScreen

    Rectangle
    {
        id: mainBackSide

        anchors.fill: parent

        color: "#EFF7FF"

        ContentArea
        {
            id: mainItemBack

            anchors.fill: parent
            anchors.topMargin: 30
            anchors.bottomMargin: 30
            anchors.leftMargin: 30
            anchors.rightMargin: 30

            bgColor: "white"

            RowLayout
            {
                anchors.fill: parent
                anchors.topMargin: 30
                anchors.bottomMargin: 30
                anchors.leftMargin: 30
                anchors.rightMargin: 30

                spacing: 70

                ContentArea
                {
                    id: mainLeftArea

                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    bgColor: "#EFF7FF"

                    ColumnLayout
                    {
                        anchors.fill: parent
                        anchors.topMargin: 30
                        anchors.bottomMargin: 30
                        anchors.leftMargin: 30
                        anchors.rightMargin: 30

                        spacing: 30

                        Item
                        {
                            id: recArea

                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            ColumnLayout
                            {
                                anchors.fill: parent
                                anchors.topMargin: 30
                                anchors.bottomMargin: 30
                                anchors.leftMargin: 30
                                anchors.rightMargin: 30

                                spacing: 10

                                Text
                                {
                                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                    text: "Запись видео"
                                    font.family: "Helvetica"
                                    font.pointSize: 24
                                    color: "black"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }

                                CustomButton
                                {
                                    id: buttonVideoStart

                                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                    buttonColorPressed: "#1163ae"
                                    buttonColorHover: "#136ec1"
                                    buttonColor: "#0085FF"
                                    buttonTextColor: "white"

                                    imageUrl: "qrc:/Images/video.png"
                                    buttonText: "Начать"

                                    onClicked: app.openVideoWindow(te.text)
                                }
                            }
                        }

                        Item
                        {
                            id: timerArea

                            Layout.fillHeight: true
                            Layout.fillWidth: true


                            ColumnLayout
                            {
                                anchors.fill: parent
                                anchors.topMargin: 30
                                anchors.bottomMargin: 30
                                anchors.leftMargin: 30
                                anchors.rightMargin: 30

                                spacing: 10

                                Text
                                {
                                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                    text: "Длительность видео"
                                    font.family: "Helvetica"
                                    font.pointSize: 24
                                    color: "black"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }

                                RowLayout
                                {
                                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                    Layout.fillHeight: true
                                    Layout.fillWidth: true

                                    spacing: 30

                                    TextEdit
                                    {
                                        id: te

                                        width: 100
                                        height: 70

                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter

                                        font.pointSize: 20;
                                        color: "#000000"

                                        text: "00:15"

                                    }

                                    CustomButton
                                    {
                                        id: buttonSetTimer

                                        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                        border_width: 2

                                        buttonColorPressed: "#1163ae"
                                        buttonColorHover: "#136ec1"
                                        buttonColor: "white"
                                        buttonTextColor: "black"

                                        imageUrl: "qrc:/Images/timer.png"
                                        buttonText: "Установить"
                                    }
                                }
                            }
                        }

                        Item
                        {
                            id: mainBottomtArea

                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            ColumnLayout
                            {
                                anchors.fill: parent
                                anchors.topMargin: 30
                                anchors.bottomMargin: 30
                                anchors.leftMargin: 30
                                anchors.rightMargin: 30

                                spacing: 10

                                Text
                                {
                                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                    text: "Загрузить видео"
                                    font.family: "Helvetica"
                                    font.pointSize: 24
                                    color: "black"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }

                                RowLayout
                                {
                                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                    Layout.fillHeight: true
                                    Layout.fillWidth: true

                                    spacing: 30

                                    CustomButton
                                    {
                                        id: buttonChoose

                                        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                        border_width: 2

                                        buttonColorPressed: "#1163ae"
                                        buttonColorHover: "#136ec1"
                                        buttonColor: "white"//"#0085FF"
                                        buttonTextColor: "black"

                                        imageUrl: "qrc:/Images/folder.png"
                                        buttonText: "Выбрать"
                                    }

                                    CustomButton
                                    {
                                        id: buttonProcessing

                                        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                        buttonColorPressed: "#1163ae"
                                        buttonColorHover: "#136ec1"
                                        buttonColor: "#0085FF"
                                        buttonTextColor: "white"

                                        imageUrl: "qrc:/Images/processing.png"
                                        buttonText: "Обработать"

                                        onClicked: mainLoader.source = "qrc:/UI/ChartWindow/ChartScreen.qml"
                                    }
                                }
                            }
                        }
                    }
                }


//------------------------------ Studio3D content --------------------------
                Item
                {
                    id: studio3dArea

                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Custom3dStudio
                    {
                        presentation_path: "qrc:/Studio3d/MaskScene/presentations/MaskScene.uip"
                    }
                }
//------------------------------ end of Studio3D content --------------------------
            }
        }
    }

    Connections
    {
        target: app

        onSendToQml:
        {
            mainLoader.source = "qrc:/UI/ChartWindow/ChartScreen.qml"
        }
    }
}
