import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "footer"

Item {

    // 歌曲封面信息
    MusicCover {
        id: cover
        width: 60
        height: parent.height
        imgWidth: 45
        imgHeight: 45
    }

    // 音乐元数据信息
    MusicMetadata {
        width: 150
        height: parent.height
        anchors.left: cover.right
    }

    // 播放控制
    PlayControl {
        anchors.centerIn: parent
        width: 140
        height: parent.height
    }
}
