//

/**
 * 音乐元数据信息
 */
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Column {
    Rectangle {
        id: metadata
        width: parent.width
        height: 35

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

                    lineHeight: metadata.height
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

                    lineHeight: metadata.height
                    lineHeightMode: Text.FixedHeight
                    verticalAlignment: Text.AlignVCenter

                    text: "尹昔眠（小田音乐社）"
                }
            }
        }
    }
    Rectangle {
        height: 25
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
