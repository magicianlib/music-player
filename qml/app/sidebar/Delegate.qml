import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    required property int index
    required property url icon
    required property url iconHighlight
    required property string title

    id: item
    height: 45
    width: listView.width

    MouseArea {
        anchors.fill: parent
        onClicked: {
            listView.currentIndex = index
        }
    }

    Rectangle {
        anchors.fill: parent
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        anchors.topMargin: 2
        radius: 10
        color: listView.currentIndex === index ? "red" : "transparent"
        RowLayout {
            anchors.fill: parent
            Image {
                Layout.leftMargin: 5
                Layout.alignment: Qt.AlignVCenter
                Layout.preferredWidth: 24
                Layout.preferredHeight: 24
                source: listView.currentIndex === index ? item.iconHighlight : item.icon
                fillMode: Image.PreserveAspectFit
            }
            Text {
                Layout.leftMargin: 4
                Layout.fillHeight: true
                Layout.fillWidth: true

                clip: true
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter

                lineHeight: height
                font.pixelSize: 14
                font.bold: listView.currentIndex === index

                color: listView.currentIndex === index ? "#ffffff" : "#707070"
                text: item.title
            }
        }
    }
}
