// 新歌速递 NewSong.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import "../../../common"

Item {
    required property real radius
    required property url coverUrl
    required property string subject  // 主标题
    required property string subtitle // 副标题

    Rectangle {
        id: card
        anchors.fill: parent
        color: "transparent"
        radius: parent.radius
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onEntered: {
                card.color = "#FFF"
            }
            onExited: {
                card.color = "transparent"
            }
        }
        RoundImage {
            id: cover
            height: 80
            width: 80
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            imageSource: coverUrl
        }
        Column {
            spacing: 8
            anchors.left: cover.right
            anchors.leftMargin: 10
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            Text {
                clip: true
                width: parent.width
                elide: Text.ElideRight
                font.pixelSize: app.fontSize
                text: subject
                color: "#423e3e"
            }
            Text {
                clip: true
                width: parent.width
                elide: Text.ElideRight
                font.pixelSize: app.smallFontSize
                text: subtitle
                color: "#847f7f"
            }
        }
    }

    DropShadow {
        source: card
        anchors.fill: parent
        horizontalOffset: 0
        verticalOffset: 0
        radius: 12
        color: "#25000000"
        smooth: true
        transparentBorder: true
        visible: mouseArea.containsMouse
    }
}
