// 顶部Banner轮播 BannerView.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "../../../common"

PathView {
    property bool isLastIndex: currentIndex === (count - 1)

    id: bannerView

    clip: true
    pathItemCount: 5
    cacheItemCount: 10

    preferredHighlightBegin: 0.5
    preferredHighlightEnd: 0.5
    snapMode: PathView.SnapOneItem

    model: model
    path: path

    onCurrentIndexChanged: {
        indicator.currentIndex = currentIndex
    }

    delegate: Component {
        RoundImage {
            required property url imgUrl

            z: PathView.z
            scale: PathView.scale
            opacity: PathView.opacity
            width: bannerView.width / 2
            height: bannerView.height
            imageRadius: 10
            imageSource: imgUrl
        }
    }

    PageIndicator{
        id: indicator
        z: 10
        count: bannerView.count
        interactive: true
        anchors.bottomMargin: 5
        anchors.bottom: bannerView.bottom
        anchors.horizontalCenter: bannerView.horizontalCenter
        onCurrentIndexChanged: bannerView.currentIndex = currentIndex
        delegate: Component{
            Rectangle{
                width: 20
                height: 5
                radius: 5
                color: indicator.currentIndex === index ? "red" : "#c6c0c0"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        indicator.currentIndex = index
                    }
                }
            }
        }
    }

    ListModel {
        id: model
        ListElement {
            imgUrl: "http://example-media.ituknown.cn/img/banner/109951169430090553.jpg"
        }
        ListElement {
            imgUrl: "http://example-media.ituknown.cn/img/banner/109951169430095902.jpg"
        }
        ListElement {
            imgUrl: "http://example-media.ituknown.cn/img/banner/109951169430111780.jpg"
        }
        ListElement {
            imgUrl: "http://example-media.ituknown.cn/img/banner/109951169443581246.jpg"
        }
        ListElement {
            imgUrl: "http://example-media.ituknown.cn/img/banner/109951169445919407.jpg"
        }
        ListElement {
            imgUrl: "http://example-media.ituknown.cn/img/banner/109951169446589864.jpg"
        }
        ListElement {
            imgUrl: "http://example-media.ituknown.cn/img/banner/109951169452067584.jpg"
        }
        ListElement {
            imgUrl: "http://example-media.ituknown.cn/img/banner/109951169456983241.jpg"
        }
        ListElement {
            imgUrl: "http://example-media.ituknown.cn/img/banner/109951169456985881.jpg"
        }
        ListElement {
            imgUrl: "http://example-media.ituknown.cn/img/banner/109951169457313028.jpg"
        }
    }

    Path {
        id: path
        startX: 0
        startY: bannerView.height / 2
        PathAttribute {name: "z"; value: 0}
        PathAttribute {name: "scale"; value: 0.7}
        PathAttribute {name: "opacity"; value: 0.6}

        PathLine {
            x: bannerView.width / 4
            y: bannerView.height / 2
        }
        PathAttribute {name: "z"; value: 1}
        PathAttribute {name: "scale"; value: 0.85}
        PathAttribute {name: "opacity"; value: 0.8}

        PathLine {
            x: bannerView.width / 2
            y: bannerView.height / 2
        }
        PathAttribute {name: "z"; value: 2}
        PathAttribute {name: "scale"; value: 1}
        PathAttribute {name: "opacity"; value: 1}

        PathLine {
            x: bannerView.width / 4 * 3
            y: bannerView.height / 2
        }
        PathAttribute {name: "z"; value: 1}
        PathAttribute {name: "scale"; value: 0.85}
        PathAttribute {name: "opacity"; value: 0.8}

        PathLine {
            x: bannerView.width
            y: bannerView.height / 2
        }
        PathAttribute {name: "z"; value: 0}
        PathAttribute {name: "scale"; value: 0.7}
        PathAttribute {name: "opacity"; value: 0.6}
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }

    Timer {
        repeat: true
        running: !mouseArea.containsMouse
        interval: 3000
        onTriggered: {
            if (bannerView.isLastIndex) {
                bannerView.currentIndex = 0
            } else {
                ++bannerView.currentIndex;
            }
        }
    }
}
