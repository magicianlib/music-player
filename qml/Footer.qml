import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "component"

Rectangle {

    // 歌曲封面信息
    Rectangle {
        id: cover
        width: 60
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }

        RoundImage {
            width: 45
            height: 45
            anchors.centerIn: parent
            imageSource: "https://p1.music.126.net/bs4wicaO87yvly7oVKBleQ==/109951165621287186.jpg"
        }
    }

    // 歌曲信息
    Column {
        width: 150
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: cover.right
        }

        Rectangle {
            id: musicInfo
            width: parent.width
            height: parent.height / 2

            ScrollView {
                anchors.fill: parent
                clip: true

                ScrollBar.horizontal: ScrollBar {
                    policy: ScrollBar.AlwaysOff
                }

                Row {
                    spacing: 5
                    Text {
                        id: title

                        color: "#515151"
                        font.bold: true
                        font.family: "Helvetica"
                        font.pointSize: 14

                        lineHeight: musicInfo.height
                        lineHeightMode: Text.FixedHeight
                        verticalAlignment: Text.AlignVCenter

                        text: "念山海"
                    }

                    Text {
                        id: artists

                        color: "#727272"
                        font.bold: true
                        font.family: "Helvetica"
                        font.pointSize: 12

                        lineHeight: musicInfo.height
                        lineHeightMode: Text.FixedHeight
                        verticalAlignment: Text.AlignVCenter

                        text: "尹昔眠（小田音乐社）"
                    }
                }
            }
        }
        Rectangle {
            height: parent.height / 2
            width: parent.width
            Text {
                id: time

                color: "#727272"
                font.family: "Helvetica"
                font.pointSize: 12

                lineHeight: parent.height
                lineHeightMode: Text.FixedHeight
                verticalAlignment: Text.AlignTop

                text: "00:00 / 02:53"
            }
        }
    }

    // 操作
    Rectangle {
        anchors.centerIn: parent
        width: 140
        height: parent.height
        // color: "green"

        // 上一曲
        Rectangle {
            id: prev
            anchors.left: parent.left
            width: 40
            height: parent.height
            color: "red"
        }
        // 播放&暂停
        Rectangle {
            id: player
            anchors.centerIn: parent
            width: 60
            height: parent.height
            color: "blue"
        }
        // 下一曲
        Rectangle {
            id: next
            anchors.right: parent.right
            width: 40
            height: parent.height
            color: "green"
        }
    }
}
