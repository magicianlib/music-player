import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


/**
 * 播放控制
 */
Item {
    Item {
        id: prev
        width: parent.height
        height: parent.height
        anchors.right: player.left
        Image {
            id: prevCtrl
            height: 16
            width: 16
            anchors.centerIn: parent
            source: "qrc:/images/prev.png"
            fillMode: Image.PreserveAspectCrop
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                prevCtrl.height = 14
                prevCtrl.width = 14
            }
            onExited: {
                prevCtrl.height = 16
                prevCtrl.width = 16
            }
        }
    }

    Item {
        id: player
        width: parent.height
        height: parent.height
        anchors.centerIn: parent
        Image {
            id: playerCtrl
            property bool playing: false
            height: 28
            anchors.centerIn: parent
            width: 28
            source: playing ? "qrc:/images/pause.png" : "qrc:/images/play.png"
            fillMode: Image.PreserveAspectCrop
        }
        MouseArea {
            hoverEnabled: true
            anchors.fill: parent
            onClicked: {
                playerCtrl.playing = !playerCtrl.playing
            }
            onEntered: {
                playerCtrl.height = 26
                playerCtrl.width = 26
            }
            onExited: {
                playerCtrl.height = 28
                playerCtrl.width = 28
            }
        }
    }
    Item {
        id: next
        width: parent.height
        height: parent.height
        anchors.left: player.right
        Image {
            id: nextCtrl
            anchors.centerIn: parent
            height: 16
            width: 16
            anchors.leftMargin: 5
            source: "qrc:/images/next.png"
            fillMode: Image.PreserveAspectCrop
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                nextCtrl.height = 14
                nextCtrl.width = 14
            }
            onExited: {
                nextCtrl.height = 16
                nextCtrl.width = 16
            }
        }
    }
}
