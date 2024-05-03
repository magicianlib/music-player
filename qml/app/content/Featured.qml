import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "../../common"

Item {
    anchors.fill: parent
    clip: true

    BannerView {
        height: 200
        width: parent.width
    }
}
