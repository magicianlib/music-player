import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


/**
 * 音乐元数据信息
 */
Column {
    spacing: 0

    Text {
        id: title
        color: "#515151"
        width: parent.width
        elide: Text.ElideRight

        font.bold: true
        font.pointSize: 15
        font.family: app.defaultFont
        text: "念山海"
    }

    Text {
        id: artists
        color: "#727272"
        width: parent.width
        elide: Text.ElideRight

        font.bold: true
        font.pointSize: 14
        font.family: app.defaultFont
        text: "尹昔眠（小田音乐社）尹昔眠（小田音乐社）尹昔眠（小田音乐社）尹昔眠（小田音乐社）"
    }
}
