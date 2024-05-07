import QtQuick
import QtQuick.Layouts

import "app"

Window {
    id: app
    minimumWidth: 1050
    minimumHeight: 720
    visible: true
    title: qsTr("网抑云")

    property int fontSize
    property int smallFontSize
    property int largeFontSize

    property real devicePixedRatio: Screen.devicePixelRatio

    onDevicePixedRatioChanged: {
        fontSize = 14 * devicePixedRatio
        smallFontSize = 12 * devicePixedRatio
        largeFontSize = 16 * devicePixedRatio
    }

    // 头部
    Header {
        id: header
        z: 99
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
