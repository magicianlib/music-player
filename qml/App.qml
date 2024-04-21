import QtQuick
import QtQuick.Layouts

Window {
    minimumWidth: 1000
    minimumHeight: 670
    visible: true
    title: qsTr("网抑云")

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
        height: 60
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    }
}
