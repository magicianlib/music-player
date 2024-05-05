// 播放进度条 PlayProgressBar.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects

ProgressBar {
    required property real duration
    signal changeValue(real value)

    id: progressBar

    from: 0
    to: duration
    value: 0

    // 背景
    background: Rectangle {
        implicitWidth: parent.width
        implicitHeight: 5
        color: "#e5e6e8"
        radius: 2
    }

    // 进度条样式
    contentItem: Rectangle {
        radius: 2
        color: "#fc3d49"
        width: progressBar.visualPosition * parent.width
    }

    // 进度球
    Rectangle {
        z: 1
        y: (parent.height / 2) * -1
        x: progressBar.visualPosition * parent.width - width / 2
        width: 10
        height: 10
        radius: 5
        color: "red"
        visible: mouseArea.showProgressTip
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

            changeValue(progressBar.value)
        }
    }
}
