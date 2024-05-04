// 播放控制 PlayControl.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    signal playPrevMusic()
    signal changePlayingStatus(bool playing)
    signal playNextMusic()

    // 上一曲
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
            source: "qrc:/images/footer/prev.png"
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
            onClicked: playPrevMusic()
        }
    }

    // 播放&暂停
    Item {
        property bool playing: false

        id: player
        width: parent.height
        height: parent.height
        anchors.centerIn: parent

        Image {
            id: playerCtrl
            width: 28
            height: 28
            anchors.centerIn: parent
            source: parent.playing ? "qrc:/images/footer/pause.png" : "qrc:/images/footer/play.png"
            fillMode: Image.PreserveAspectCrop
        }

        MouseArea {
            hoverEnabled: true
            anchors.fill: parent
            onClicked: {
                parent.playing = !parent.playing
                changePlayingStatus(parent.playing)
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

    // 下一曲
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
            source: "qrc:/images/footer/next.png"
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
            onClicked: playNextMusic()
        }
    }
}
