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

        // font.family: app.defaultFont
        font.pixelSize: app.largeFontSize
        text: "念山海"
    }

    Text {
        id: artists
        color: "#727272"
        width: parent.width
        elide: Text.ElideRight

        // font.family: app.defaultFont
        font.pixelSize: app.fontSize
        text: "尹昔眠（小田音乐社）"
    }
}
