import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects

ProgressBar {
    required property real duration

    id: progressBar

    from: 0
    to: duration
    value: 159.4

    // 背景
    background: Rectangle {
        implicitWidth: parent.width
        implicitHeight: 5
        color: "#e5e6e8"
        radius: 2
    }

    // 进度条样式
    contentItem: Item {
        Rectangle {
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: progressBar.visualPosition * parent.width
            color: "#fc3d49"
            radius: 2
        }
    }

    // 进度球
    Rectangle {
        z: 1
        x: progressBar.visualPosition * parent.width - width / 2

        width: 10
        height: 10
        radius: 5

        color: "#FFFFFF"
        antialiasing: true
        visible: mouseArea.showProgressTip
        anchors.verticalCenter: parent.verticalCenter

        // 阴影效果
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset: 0
            verticalOffset: 0
            color: "#80000000"
            samples: 2
            antialiasing: true
        }
    }

    MouseArea {
        property bool mousePressAndMove: false
        // 是否显示进度条进度提示
        property bool showProgressTip: containsMouse | mousePressAndMove

        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            // 点击时改变进度条进度(值为鼠标位置与进度条宽度占比)
            progressBar.value = mouseX / progressBar.width * parent.to
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

            // 鼠标有效移动状态
            mousePressAndMove = true

            // 拖拽时改变进度条进度(值为鼠标位置与进度条宽度占比)
            progressBar.value = mouseX / progressBar.width * progressBar.to
        }
    }
}
