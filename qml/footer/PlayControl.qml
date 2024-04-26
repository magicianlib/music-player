import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


/**
 * 播放控制
 */
Item {
    // 上一曲
    Rectangle {
        id: prev
        anchors.left: parent.left
        width: 40
        height: parent.height
        color: "red"
    }
    // 播放&暂停
    Rectangle {
        id: player
        anchors.centerIn: parent
        width: 60
        height: parent.height
        color: "blue"
    }
    // 下一曲
    Rectangle {
        id: next
        anchors.right: parent.right
        width: 40
        height: parent.height
        color: "green"
    }
}
