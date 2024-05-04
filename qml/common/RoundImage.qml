// 圆角图片 RoundImage.qml
import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    required property url imageSource
    property real imageRadius: 5

    Image {
        id: img
        anchors.fill: parent
        source: imageSource
        fillMode: Image.PreserveAspectCrop
        antialiasing: true
        visible: false
    }

    Rectangle {
        id: mask
        anchors.fill: parent
        radius: imageRadius
        antialiasing: true
        visible: false
    }

    OpacityMask {
        source: img
        maskSource: mask
        anchors.fill: img
        antialiasing: true
    }
}
