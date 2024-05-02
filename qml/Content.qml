import QtQuick
import QtQuick.Layouts

Item {
    RowLayout {
        anchors.fill: parent
        clip: true
        spacing: 0
        Item {
            Layout.preferredWidth: 200
            Layout.fillHeight: true

            ListView {
                id: listView
                currentIndex: 0
                anchors.fill: parent
                model: ListModel {
                    ListElement {
                        title: "云音乐精选"
                        icon: "qrc:/images/sidebar/featured.png"
                        iconHight: "qrc:/images/sidebar/featured-h.png"
                    }
                    ListElement {
                        title: "博客"
                        icon: "qrc:/images/sidebar/podcast.png"
                        iconHight: "qrc:/images/sidebar/podcast-h.png"
                    }
                    ListElement {
                        title: "社区"
                        icon: "qrc:/images/sidebar/community.png"
                        iconHight: "qrc:/images/sidebar/community-h.png"
                    }
                }

                delegate: Component {
                    Item {
                        required property int index
                        required property string title
                        required property url icon
                        required property url iconHight

                        id: item
                        height: 45
                        width: parent.width

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
                                    source: listView.currentIndex === index ? item.iconHight : item.icon
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
                }
            }
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "red"
        }
    }
}
