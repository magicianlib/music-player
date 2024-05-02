import QtQuick
import QtQuick.Layouts

Window {
    id: app
    minimumWidth: 1050
    minimumHeight: 720
    visible: true
    title: qsTr("网抑云")

    readonly property string defaultFont: defaultFount()
    readonly property int fontSize: 12 * Screen.devicePixedRatio
    readonly property int largeFontSize: 15 * Screen.devicePixedRatio

    function defaultFount() {
        return Qt.platform.os === "osx" ? "PingFang SC" : "Microsoft YaHei UI"
    }

    function changeFontSize() {
        fontSize = 12 * Screen.devicePixedRatio
        largeFontSize = 15 * Screen.devicePixedRatio
    }

    onWidthChanged: changeFontSize()
    onHeightChanged: changeFontSize()

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
