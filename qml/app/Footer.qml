// Footer.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects
import QtMultimedia

import "footer"
import "../common"

/**
 * 底部控制
 */
Rectangle {

    color: "#fafafa"

    // 歌曲封面信息
    Turntable {
        id: turntable
        diameter: 60
        outerRing: 20
        rotating: false
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 30
        imageSource: "https://p1.music.126.net/bs4wicaO87yvly7oVKBleQ==/109951165621287186.jpg"
        // imageSource: "https://p2.music.126.net/ajC8MIFiLvQPOu-YUw8-dQ==/109951168459978894.jpg"
    }

    // 音乐元数据信息
    MusicMetadata {
        id: metadata
        title: "我曾诅咒你"
        artist: "槑槑MEIMEI乐队"
        width: 150
        anchors.left: turntable.right
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
    }

    // 播放控制
    Rectangle {
        width: 400
        height: parent.height
        anchors.centerIn: parent
        color: "transparent"

        Column {
            spacing: 10
            width: parent.width
            anchors.centerIn: parent

            PlayControl {
                height: 30
                width: parent.width
                onChangePlayingStatus: function(playing) {
                    turntable.rotating = playing
                    if (playing) {
                        mediaplayer.play()
                    } else {
                        mediaplayer.pause()
                    }
                }
            }

            PlayProgressBar {
                id: progressBar
                width: parent.width
                duration: 0
                value: 0
                onChangeValue: function(value) {
                    mediaplayer.position = value
                }
            }
        }
    }

    MediaPlayer {
        id: mediaplayer
        loops: MediaPlayer.Infinite
        audioOutput: AudioOutput {}
        source: "http://example-media.ituknown.cn/%E6%A7%91%E6%A7%91MEIMEI%E4%B9%90%E9%98%9F%20-%20%E6%88%91%E6%9B%BE%E8%AF%85%E5%92%92%E4%BD%A0.mp3"
        Component.onCompleted: {
            progressBar.duration = mediaplayer.duration
        }
        onMediaStatusChanged: {
        }
        onPositionChanged: {
            if (!!mediaplayer.position) {
                progressBar.value = mediaplayer.position
            }
        }
    }
}
