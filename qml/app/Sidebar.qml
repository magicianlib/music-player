import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "sidebar"

Rectangle {
    signal currentQmlSource(string qmlSource)

    color: "#f0f3f6"

    ListView {
        id: listView
        anchors.fill: parent
        flickDeceleration: 12000 // 滚动衰减速度
        model: ListModel {
            ListElement {
                title: "云音乐精选"
                icon: "qrc:/images/sidebar/featured.png"
                iconHight: "qrc:/images/sidebar/featured-h.png"
                qmlSource: ""
            }
            ListElement {
                title: "博客"
                icon: "qrc:/images/sidebar/podcast.png"
                iconHight: "qrc:/images/sidebar/podcast-h.png"
                qmlSource: ""
            }
            ListElement {
                title: "社区"
                icon: "qrc:/images/sidebar/community.png"
                iconHight: "qrc:/images/sidebar/community-h.png"
                qmlSource: ""
            }
        }
        delegate: Delegate {}
        onCurrentItemChanged: {
            if (!currentItem) {
                return
            }
            currentQmlSource(currentItem.qmlSource)
        }
    }
}
