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
Item {
    Rectangle {
        id: footer
        anchors.fill: parent

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
        Item {
            width: 400
            height: parent.height
            anchors.centerIn: parent
            Column {
                spacing: 10
                width: parent.width
                anchors.centerIn: parent
                // 控制按钮
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

                // 进度条
                Progress {
                    id: progressBar
                    height: 5
                    width: parent.width
                    radius: height / 2
                    backgroundColor: "#e5e6e8"
                    foregroundColor: "#fc3d49"
                    percentage: 0
                    onChangePercentage: {
                        mediaplayer.position = percentage * mediaplayer.duration
                    }
                }
            }
        }

        // 音量控制
        Row {
            spacing: 10
            anchors.right: parent.right
            anchors.rightMargin: 30
            anchors.verticalCenter: parent.verticalCenter
            Image {
                property bool close: false
                property real lastPercentage

                id: voiceIcon
                width: 24
                height: 24
                fillMode: Image.PreserveAspectCrop
                verticalAlignment: Qt.AlignHCenter
                source: close ? "qrc:/images/footer/voice-close.png" : "qrc:/images/footer/voice.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        parent.close = !parent.close;
                        if (parent.close) {
                            parent.lastPercentage = volumeControl.percentage
                            voice.volume = volumeControl.percentage = 0
                        } else {
                            voice.volume = volumeControl.percentage = parent.lastPercentage
                        }
                    }
                }
            }
            Progress {
                id: volumeControl
                anchors.verticalCenter: parent.verticalCenter
                width: 120
                height: 5
                radius: height / 2
                percentage: 0.2 // 初始音量
                backgroundColor: "#e5e6e8"
                foregroundColor: "#fc3d49"
                onChangePercentage: {
                    voiceIcon.close = percentage === 0
                    voice.volume = percentage
                }
            }
        }
    }

    MediaPlayer {
        id: mediaplayer
        loops: MediaPlayer.Infinite
        audioOutput: AudioOutput {
            id: voice
            volume: volumeControl.percentage
        }
        source: "http://example-media.ituknown.cn/%E6%A7%91%E6%A7%91MEIMEI%E4%B9%90%E9%98%9F%20-%20%E6%88%91%E6%9B%BE%E8%AF%85%E5%92%92%E4%BD%A0.mp3"
        Component.onCompleted: {
        }
        onPositionChanged: {
            if (position) {
                progressBar.percentage = position / duration
            }
        }
    }

    // 边框阴影
    DropShadow {
        anchors.fill: parent
        source: footer
        verticalOffset: 0
        radius: 12
        color: "#30000000"
        smooth: true
        transparentBorder: true
    }
}
