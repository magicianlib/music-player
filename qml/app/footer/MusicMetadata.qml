// 音乐元数据信息 MusicMetadata.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Column {
    required property string title
    required property string artist

    spacing: 2

    Text {
        color: "#515151"
        width: parent.width
        elide: Text.ElideRight
        font.family: app.defaultFont
        font.pixelSize: app.fontSize
        text: title
    }

    Text {
        color: "#727272"
        width: parent.width
        elide: Text.ElideRight
        font.family: app.defaultFont
        font.pixelSize: app.smallFontSize
        text: artist
    }
}
