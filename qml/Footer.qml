import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

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
            imageSource: "https://p2.music.126.net/8ltR3o9R8uJ9_5Cc71cDhA==/109951162951242154.jpg"
        }
    }

    // 歌曲信息
    Column {
        width: 200
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: cover.right
        }

        Rectangle {
            height: 35
            width: 120

            Text {
                id: title
                font.bold: true
                font.family: "Helvetica"
                font.pointSize: 14
                width: parent.width - artists.implicitHeight
                text: "红昭愿红昭愿红昭愿红昭愿"
                color: "#515151"
                lineHeight: parent.height
                lineHeightMode: Text.FixedHeight
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            Text {
                id: artists
                anchors.left: title.right
                font.family: "Helvetica"
                font.pointSize: 12
                text: " - 音阙诗听"
                color: "#727272"
                lineHeight: parent.height
                lineHeightMode: Text.FixedHeight
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }
        Rectangle {
            height: 25
            width: parent.width
            Text {
                width: parent.width
                font.family: "Helvetica"
                font.pointSize: 12
                text: "00:00 / 02:53"
                color: "#727272"
                lineHeight: parent.height
                lineHeightMode: Text.FixedHeight
                verticalAlignment: Text.AlignTop
                elide: Text.ElideRight
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
    }：

    // Rectangle {
    //     width: 60
    //     height: parent.height
    //     color: "yellow"
    // }
}
