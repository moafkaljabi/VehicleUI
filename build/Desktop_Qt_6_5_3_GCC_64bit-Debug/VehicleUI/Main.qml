import QtQuick
import "ui/BottomBar"
import "ui/RightScreen"
import "ui/LeftScreen"

import QtPositioning
import QtLocation
Window {
    width: 1080
    height: 720
    visible: true
    title: qsTr("My Dashboard")



    RightScreen {
        id: rightScreen
    }

    LeftScreen {
        id: leftScreen
    }

    BottomBar {
    id: bottomBar
    }
}
