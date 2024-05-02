import QtQuick
import QtQuick.Layouts

import "app"

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
    RowLayout {
        anchors.top: header.bottom
        anchors.bottom: footer.top
        anchors.left: parent.left
        anchors.right: parent.right

        clip: true
        spacing: 0

        // 侧边栏
        Sidebar {
            Layout.preferredWidth: 200
            Layout.fillHeight: true
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "red"
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
