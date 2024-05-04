// Turntable.qml
import QtQuick
import Qt5Compat.GraphicalEffects

/**
 * 唱盘
 */
Rectangle {
    property url imageSource
    required property real diameter // 唱盘直径
    required property real outerRing // 唱盘外环宽度（黑色绝缘部分）
    readonly property real cdDiameter: (diameter - outerRing)

    property alias rotating: animation.running // 旋转

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
        id: opacityMask
        source: img
        maskSource: mask
        anchors.fill: mask
        antialiasing: true
    }

    RotationAnimation {
        id: animation
        target: opacityMask
        duration: 15000
        loops: Animation.Infinite
        from: opacityMask.rotation
        to: opacityMask.rotation + 360
    }
}
