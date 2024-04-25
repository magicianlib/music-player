import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "footer"
import "component"

Item {

    // 歌曲封面信息
    Turntable {
        id: cover
        width: 60
        height: 60
        maskDiameter: 40
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 30
        imageSource: "https://p1.music.126.net/bs4wicaO87yvly7oVKBleQ==/109951165621287186.jpg"
    }

    // 音乐元数据信息
    MusicMetadata {
        width: 150
        height: parent.height
        anchors.left: cover.right
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
    }

    // 播放控制
    Rectangle {
        width: 400
        anchors.centerIn: parent
        height: parent.height
        color: "red"
    }
    // PlayControl {
    //     anchors.centerIn: parent
    //     width: 500
    //     height: parent.height
    // }
}
