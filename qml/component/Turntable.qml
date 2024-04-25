import QtQuick
import Qt5Compat.GraphicalEffects

Rectangle {
    required property url imageSource
    property real maskDiameter

    color: "black"
    radius: width / 2

    Image {
        id: img
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: imageSource
        antialiasing: true
        visible: false
    }

    Rectangle {
        id: mask
        anchors.centerIn: parent
        width: maskDiameter
        height: maskDiameter
        radius: maskDiameter / 2
        antialiasing: true
        visible: false
    }

    OpacityMask {
        source: img
        maskSource: mask
        anchors.fill: mask
        antialiasing: true
    }
}
