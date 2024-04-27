import QtQuick
import Qt5Compat.GraphicalEffects


/**
 * 唱盘
 */
Rectangle {
    required property url imageSource
    // 唱盘直径
    required property real diameter
    // 唱盘外环宽度（黑色绝缘部分）
    required property real outerRing

    readonly property real cdDiameter: diameter - outerRing

    color: "black"

    width: diameter
    height: diameter
    radius: diameter / 2
    antialiasing: true

    Image {
        id: img
        width: cdDiameter
        height: cdDiameter
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectCrop
        source: imageSource
        antialiasing: true
        visible: false
    }

    Rectangle {
        id: mask
        width: cdDiameter
        height: cdDiameter
        radius: cdDiameter / 2
        anchors.centerIn: parent
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
