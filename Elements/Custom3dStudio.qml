import QtQuick 2.15
import QtQuick3D 1.15
import QtStudio3D.OpenGL 2.5



Studio3D
{
    id: studio3D

    anchors.fill: parent

    property url presentation_path: presentation_path

    ViewerSettings
    {

        scaleMode: ViewerSettings.ScaleModeFit
    }

    Presentation
    {
        source: presentation_path
    }
}

