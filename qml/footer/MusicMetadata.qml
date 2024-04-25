
/**
 * 音乐元数据信息
 */
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Column {
    Text {
        id: title
        color: "#515151"
        width: parent.width
        elide: Text.ElideRight

        font.bold: true
        font.pointSize: 12
        font.family: "Helvetica"

        lineHeight: parent.height / 2
        lineHeightMode: Text.FixedHeight
        verticalAlignment: Text.AlignBottom

        text: "念山海"
    }

    Text {
        id: artists
        color: "#727272"
        width: parent.width
        elide: Text.ElideRight

        font.bold: true
        font.pointSize: 10
        font.family: "Helvetica"

        lineHeight: parent.height / 2
        lineHeightMode: Text.FixedHeight
        verticalAlignment: Text.AlignTop

        text: "尹昔眠（小田音乐社）尹昔眠（小田音乐社）尹昔眠（小田音乐社）尹昔眠（小田音乐社）"
    }
}
