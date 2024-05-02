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
        color: "transparent"

        Column {
            spacing: 10
            width: parent.width
            anchors.centerIn: parent
            PlayControl {
                height: 30
                width: parent.width
            }
            PlayProgressBar {
                width: parent.width
                duration: 300
            }
        }
    }
}
