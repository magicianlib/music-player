// 播放进度条 PlayProgressBar.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects

Rectangle {
    required property color backgroundColor
    required property color foregroundColor
    required property real  percentage
    required property real  radius

    signal changePercentage(real value)

    id: progressBar
    color: backgroundColor

    Rectangle {
        id: progress
        anchors.left: parent.left
        color: foregroundColor
        radius: parent.radius
        height: parent.height
        width: percentage * parent.width
        onWidthChanged: {
            if (width > parent.width) {
                width = parent.width
            }
        }

        Rectangle {
            id: tip
            z: 10
            x: parent.width - width / 2
            anchors.verticalCenter: parent.verticalCenter
            width: parent.height * 2
            height: parent.height * 2
            radius: width / 2
            color: "#FFFFFF"
            visible: false
            layer.enabled: visible
            layer.effect: DropShadow {
                verticalOffset: 0
                horizontalOffset: 0
                radius: 8
                color: "#50000000"
                smooth: true
                transparentBorder: true
            }
        }
    }

    MouseArea {
        property bool mousePressAndMove: false
        property bool showProgressTip: containsMouse | mousePressAndMove // 是否显示进度条进度提示

        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            // 点击时改变进度条进度(值为鼠标位置与进度条宽度占比)
            progressBar.percentage = mouseX / progressBar.width
        }
        onMouseXChanged: {
            // 非按压状态不处理
            if (!pressed) {
                mousePressAndMove = false
                return
            }

            // 鼠标超过范围不处理
            if (mouseX < 0 || mouseX > progressBar.width) {
                mousePressAndMove = false
                return
            }
            if (mouseX > progressBar.width) {
                mousePressAndMove = false
                return
            }

            // 鼠标有效移动状态
            mousePressAndMove = true

            // 拖拽时改变进度条进度(值为鼠标位置与进度条宽度占比)
            progressBar.percentage = mouseX / progressBar.width
            changePercentage(progressBar.percentage)
        }
    }
}
