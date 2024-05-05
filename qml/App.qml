import QtQuick
import QtQuick.Layouts

import "app"

Window {
    id: app
    minimumWidth: 1050
    minimumHeight: 720
    visible: true
    title: qsTr("网抑云")

    property string defaultFont: defaultFount()
    property int fontSize: 14 * (Screen.devicePixedRatio ? Screen.devicePixedRatio : 1)
    property int smallFontSize: 12 * (Screen.devicePixedRatio ? Screen.devicePixedRatio : 1)
    property int largeFontSize: 16 * (Screen.devicePixedRatio ? Screen.devicePixedRatio : 1)

    Component.onCompleted: {
        console.log(Screen.devicePixedRatio)
    }

    function defaultFount() {
        return Qt.platform.os === "osx" ? "PingFang SC" : "Microsoft YaHei UI"
    }

    function changeFontSize() {
        fontSize = 14 * (Screen.devicePixedRatio ? Screen.devicePixedRatio : 1)
        smallFontSize = 12 * (Screen.devicePixedRatio ? Screen.devicePixedRatio : 1)
        largeFontSize = 16 * (Screen.devicePixedRatio ? Screen.devicePixedRatio : 1)
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
        spacing: 0
        anchors.top: header.bottom
        anchors.bottom: footer.top
        anchors.left: parent.left
        anchors.right: parent.right

        // 侧边栏
        Sidebar {
            Layout.preferredWidth: 200
            Layout.fillHeight: true
            onChangeQmlSource: function (qmlSource) {
                console.log("currentItem change:", qmlSource)
            }
        }

        //  显示内容
        Loader {
            Layout.fillWidth: true
            Layout.fillHeight: true
            asynchronous: true
            source: "app/content/Featured.qml"
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
