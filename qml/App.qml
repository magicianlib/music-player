import QtQuick
import QtQuick.Layouts

Window {
    id: app
    minimumWidth: 1050
    minimumHeight: 720
    visible: true
    title: qsTr("网抑云")

    readonly property string defaultFont: defaultFount()
    readonly property int defaultFontSize: 15

    function defaultFount() {
        if (Qt.platform.os === "osx") {
            return "PingFang SC"
        } else {
            // windows
            return "Microsoft YaHei UI"
        }
    }

    onWidthChanged: {
        console.log(width)
    }

    // 头部
    Header {
        id: header
        height: 50
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        color: "cyan"
    }

    // 内容区域
    Content {
        id: content
        color: "teal"
        anchors {
            top: header.bottom
            bottom: footer.top
            left: parent.left
            right: parent.right
        }
    }

    // 底部
    Footer {
        id: footer
        height: 80
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    }
}
