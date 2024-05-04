// 新歌速递 NewSong.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "../../../common"

Flow {
    property alias listModel: repeater.model

    spacing: 10
    padding: 10

    Text{
        height: 30
        width: parent ? parent.width : 0
        verticalAlignment: Text.AlignVCenter
        text: "<h1>热门电台</h1>"
        textFormat: Text.RichText
    }

    Repeater {
        id: repeater
        model: ListModel{}
        visible: false

        MusicCard {
            required property url imageUrl
            required property string title
            required property string artist

            width: 250
            height: 100
            radius: 10
            subject: title
            subtitle: artist
            coverUrl: imageUrl
        }
    }
}
