// Featured.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "../../common"
import "featured"

import cn.magician.HttpClient

/**
 * 云音乐精选
 */
Rectangle {
    anchors.fill: parent
    color: "#f7f9fc"

    Flickable {
        anchors.fill: parent
        flickDeceleration: 12000      // 滚动衰减速度
        contentHeight: content.height // 内容高度
        ScrollBar.vertical: ScrollBar {
            policy: ScrollBar.AsNeeded
        }

        ColumnLayout {
            id: content
            spacing: 10
            anchors.left: parent.left
            anchors.right: parent.right

            BannerView {
                height: 200
                Layout.fillWidth: true
            }

            NewSong{
                Layout.fillWidth: true
            }

            PopularRadioStation {
                id: station
                Layout.fillWidth: true
                Component.onCompleted: client.popularRadioStation()
            }
        }
    }

    HttpClient {
        id: client
        onNotify: function(result){
            if (result) {
                var data = JSON.parse(result)
                var jsonArr =  data.djRadios
                for (var idx in jsonArr) {
                    station.listModel.append({
                         "artist": jsonArr[idx].name,
                         "title": jsonArr[idx].rcmdtext,
                         "imageUrl": jsonArr[idx].picUrl
                     })
                }
            }
        }
    }
}
