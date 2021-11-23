import QtQuick 2.15
import QtQuick.Controls 2.15


FocusScope
{
    id: focusScope;

    height: textInput.paintedHeight + (2 * textInput.anchors.topMargin);

    property alias value: textInput.text;
    property alias fontSize: textInput.font.pointSize;
    property alias textColor: textInput.color;


    Rectangle
    {
        id: background;

        anchors.fill: parent;

        color: "#F4F6F8";
        radius: 5;
        antialiasing: true;

        border
        {
            width: 3;
            color: (focusScope.activeFocus ? "red" : "steelblue");
        }
    }

    TextEdit
    {
        id: textInput;

        anchors
        {
            top: parent.top;
            topMargin: 10;
            left: parent.left;
            leftMargin: 10;
            right: parent.right;
            rightMargin: 10;
        }

        focus: true
        selectByMouse: true
        font.pointSize: 20;
        wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere;
        color: "black";   
    }

    MouseArea
    {
        anchors.fill: parent

        visible: (!focusScope.activeFocus); 

        onClicked: { textInput.forceActiveFocus(); }
    }
}
