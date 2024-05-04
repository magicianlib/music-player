// 新歌速递 NewSong.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "../../../common"

Flow {
    spacing: 10
    padding: 10
    Text{
        height: 30
        width: parent.width
        verticalAlignment: Text.AlignVCenter
        text: "<h1>新歌速递</h1>"
        textFormat: Text.RichText
    }

    Repeater {
        model: ListModel {
            ListElement {
                imageUrl: "http://p1.music.126.net/HG_ieYFjSlzhfz0oYpFmtA==/109951169546098248.jpg"
                title: "世间最美的约定"
                artist: "网易云音乐×吉卜力工作室"
            }
            ListElement {
                imageUrl: "https://p2.music.126.net/iAwVf8ag_45csIUuh1wSZg==/109951168912558470.jpg"
                title: "海阔天空"
                art: "Beyond"
            }
            ListElement {
                imageUrl: "https://p1.music.126.net/A9bq2yZV4ilcVH3Ytrg0gg==/109951169490652799.jpg"
                title: "无色花"
                artist: "乘风2024全体成员"
            }
            ListElement {
                imageUrl: "https://p2.music.126.net/x5pKv13aISyYuRrHSQ5bWA==/109951169426618905.jpg"
                title: "玄鸟"
                artist: "萨吉"
            }
            ListElement {
                imageUrl: "https://p1.music.126.net/bs4wicaO87yvly7oVKBleQ==/109951165621287186.jpg"
                title: "念山海"
                artist: "尹昔眠"
            }
            ListElement {
                imageUrl: "https://p2.music.126.net/ajC8MIFiLvQPOu-YUw8-dQ==/109951168459978894.jpg"
                title: "我曾诅咒你"
                artist: "槑槑MEIMEI乐队"
            }
        }

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
