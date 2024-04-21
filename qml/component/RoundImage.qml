import QtQuick
import Qt5Compat.GraphicalEffects

Rectangle {
    required property url imageSource

    color: "transparent"
    radius: 5

    Image {
        id: img
        source: imageSource
        visible: false

        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle {
        id: mask
        anchors.fill: parent
        radius: parent.radius
        visible: false
    }

    OpacityMask {
        source: img
        maskSource: mask
        anchors.fill: img
    }
}
