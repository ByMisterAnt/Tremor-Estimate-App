import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtQml.Models 2.3

Window {
    width: 360
    height: 460
    visible: true
    title: qsTr("Hello World")
    color: "#00003a"
    Rectangle {
        id: menuRectangle

        anchors{
            top: parent.top; topMargin: 20
            bottom: parent.bottom; bottomMargin: 20
            left: parent.left; leftMargin: 20
            right: parent.right; rightMargin: 20
        }

        radius: 5
        color: "#00517d"

        Text {
            anchors{
                top: parent.top; topMargin: 20
                bottom: innerRectangle.top; bottomMargin: 20
                left: parent.left; leftMargin: 20
                right: parent.right; rightMargin: 20
            }

            text: "Выберете устройство"
            horizontalAlignment: Text.AlignHCenter
            color: "white"
            font { bold: true; pixelSize: 24 }

            width: parent.width/2 - 10
            height: parent.height
        }

        Rectangle {
            id: innerRectangle

            anchors.centerIn: menuRectangle
            width: parent.width - 40
            height: parent.height - 160

            color: "#004eff"
            radius: 5


//            ListModel{
//                id: fruitModel

//                    CustomList {
//                        name: "Apple"
//                     //   cost: 2.45
//                    }
//                    CustomList {
//                        name: "Orange"
//                       // cost: 3.25
//                    }
//                    CustomList {
//                        name: "Banana"
//                    //    cost: 1.95
//                    }
//                }


        }
    }

    Row {
        id: buttomRow
        height: 40
        anchors{
            top: innerRectangle.bottom; topMargin: 20
            bottom: menuRectangle.bottom; bottomMargin: 20
            left: menuRectangle.left; leftMargin: 20
            right: menuRectangle.right; rightMargin: 20
        }

        spacing: 20

        MenuButton {
            id: menuButtonUpdate
            width: parent.width/2 - 10
            height: parent.height
            background_color: this.pressed ? "#00003a" : "#00517d"
            border_radius: 5
        }

        MenuButton {
            id: menuButtonChoose
            width: parent.width/2 - 10
            height: parent.height
            background_color: this.pressed ? "#00003a" : "#00517d"
            border_radius: 5
            button_text: "flex"

            CustomGif{
                width: 40
                height: 40
                gif_path: "qrc:/409-tool-outline.gif"
            }
    }
    }
}
