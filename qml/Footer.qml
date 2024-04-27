import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects

import "footer"
import "component"

Rectangle {

    color: "#fafafa"

    // 歌曲封面信息
    Turntable {
        id: cover
        diameter: 60
        outerRing: 20
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 30
        imageSource: "https://p1.music.126.net/bs4wicaO87yvly7oVKBleQ==/109951165621287186.jpg"
    }

    // 音乐元数据信息
    MusicMetadata {
        id: metadata
        width: 150
        anchors.left: cover.right
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
    }

    // 播放控制
    Rectangle {
        width: 400
        height: parent.height
        anchors.centerIn: parent

        Column {
            anchors.fill: parent
            Rectangle {
                height: 50
                width: parent.width
                color: "green"
            }

            spacing: 10

            PlayProgressBar {
                width: parent.width
                duration: 300
            }
        }
    }
    // PlayControl {
    //     anchors.centerIn: parent
    //     width: 500
    //     height: parent.height
    // }
}
