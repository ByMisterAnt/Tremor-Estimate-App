import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import  "../../Elements"

Item {

    id: mainWindow

    Rectangle{

        id: mainBackSide

        anchors.fill: parent

        color: "#EFF7FF"

        ContentArea{

            id: mainItemBack

            anchors.fill: parent
            anchors.topMargin: 30
            anchors.bottomMargin: 30
            anchors.leftMargin: 30
            anchors.rightMargin: 30

            bgColor: "white"

            RowLayout {

                anchors.fill: parent
                anchors.topMargin: 30
                anchors.bottomMargin: 30
                anchors.leftMargin: 30
                anchors.rightMargin: 30

                spacing: 30

                ContentArea{
                    id: mainLeftArea

                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    bgColor: "#E5E5E5"

                    ColumnLayout{

                        anchors.fill: parent
                        anchors.topMargin: 30
                        anchors.bottomMargin: 30
                        anchors.leftMargin: 30
                        anchors.rightMargin: 30
                        spacing: 30

                        ContentArea{

                            id: recArea
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            bgColor: "#EFF7FF"

                            ColumnLayout{

                                anchors.fill: parent
                                anchors.topMargin: 30
                                anchors.bottomMargin: 30
                                anchors.leftMargin: 30
                                anchors.rightMargin: 30

                                spacing: 10

                                Text {

                                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                    text: "Запись видео"
                                    font.family: "Helvetica"
                                    font.pointSize: 24
                                    color: "black"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }

                                CustomButton {
                                    id: buttonVideoStart

                                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                    buttonColorPressed: "#1163ae"
                                    buttonColorHover: "#136ec1"
                                    buttonColor: "#0085FF"
                                    buttonTextColor: "white"

                                    imageUrl: "qrc:/Images/write_icon.png"
                                    buttonText: "Начать"
                                }

                            }
                        }

                        ContentArea{
                            id: timerArea
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            bgColor: "#EFF7FF"

                            ColumnLayout{

                                anchors.fill: parent
                                anchors.topMargin: 30
                                anchors.bottomMargin: 30
                                anchors.leftMargin: 30
                                anchors.rightMargin: 30

                                spacing: 10

                                Text {

                                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                    text: "Длительность видео"
                                    font.family: "Helvetica"
                                    font.pointSize: 24
                                    color: "black"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }

                                RowLayout{

                                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                    Layout.fillHeight: true
                                    Layout.fillWidth: true

                                    spacing: 30

                                    TextEdit {
                                        id: te
                                        font.pointSize: 20;
                                        text: "00:15"
                                    }

                                    CustomButton {
                                        id: buttonSetTimer

                                        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                        buttonColorPressed: "#1163ae"
                                        buttonColorHover: "#136ec1"
                                        buttonColor: "#0085FF"
                                        buttonTextColor: "white"

                                        imageUrl: "qrc:/Images/write_icon.png"
                                        buttonText: "Установить"
                                    }
                                }

                            }
                        }
                    }
                }

                ContentArea{
                id: mainRightArea

                Layout.fillHeight: true
                Layout.fillWidth: true

                bgColor: "#E5E5E5"

                ColumnLayout{

                    anchors.fill: parent
                    anchors.topMargin: 30
                    anchors.bottomMargin: 30
                    anchors.leftMargin: 30
                    anchors.rightMargin: 30
                    spacing: 30

                    ContentArea{
                        id: processingArea
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        bgColor: "#EFF7FF"

                        ColumnLayout{

                            anchors.fill: parent
                            anchors.topMargin: 30
                            anchors.bottomMargin: 30
                            anchors.leftMargin: 30
                            anchors.rightMargin: 30

                            spacing: 10

                            Text {

                                Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                text: "Загрузить видео"
                                font.family: "Helvetica"
                                font.pointSize: 24
                                color: "black"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }


                            RowLayout{

                                Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                Layout.fillHeight: true
                                Layout.fillWidth: true

                                spacing: 30

                                    CustomButton {
                                        id: buttonChoose

                                        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                        buttonColorPressed: "#1163ae"
                                        buttonColorHover: "#136ec1"
                                        buttonColor: "#0085FF"
                                        buttonTextColor: "white"

                                        imageUrl: "qrc:/Images/write_icon.png"
                                        buttonText: "Выбрать"
                                    }

                                    CustomButton {
                                        id: buttonProcessing

                                        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                        buttonColorPressed: "#1163ae"
                                        buttonColorHover: "#136ec1"
                                        buttonColor: "#0085FF"
                                        buttonTextColor: "white"

                                        imageUrl: "qrc:/Images/write_icon.png"
                                        buttonText: "Обработать"

                                        onClicked: mainLoader.source = "qrc:/UI/ChartWindow/ChartScreen.qml"
                                    }
                                }
                            }
                        }

                        ContentArea{
                            id: viewArea
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            bgColor: "red"
                        }
                    }
                }
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
