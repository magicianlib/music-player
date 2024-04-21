
/**
 * 音乐封面信息
 */
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "../component"

Item {

    property real imgWidth: width
    property real imgHeight: height

    RoundImage {
        width: imgWidth
        height: imgHeight
        anchors.centerIn: parent
        imageSource: "https://p1.music.126.net/bs4wicaO87yvly7oVKBleQ==/109951165621287186.jpg"
    }
}
