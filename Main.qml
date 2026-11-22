import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import "shapes"
import "shapes/material-shapes.js" as MaterialShapes
import "components"

ApplicationWindow {
    id: window
    width: 640
    height: 480
    minimumWidth: 200
    minimumHeight: 250
    visible: true
    title: qsTr("nnuen")
    color: "#211F21"

    footer: TabBar {
        id: tabBar
        height: 64 // Nice roomy height for little buttons
        background: Rectangle {
            color: "#171517"
        }
        NavButton { id: homeTab }
        NavButton { id: accountTab; iconName: "account_circle" }
    }


    Button {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 16
        id: playButton
        width: 64; height: 64
        hoverEnabled: true
        scale: pressed ? 0.9 : (hovered ? 1.1 : 1.0)
        Behavior on scale { SpringAnimation { spring: 3; damping: 0.15; epsilon: 0.001 } }

        background: ShapeCanvas {
            rotation: 90
            width: parent.width; height: parent.height
            color: "#FFFFFF"
            roundedPolygon: playButton.hovered ? MaterialShapes.getArrow()
                                               : MaterialShapes.getCookie9Sided()
            Behavior on rotation { SpringAnimation { spring: 3; damping: 0.3; epsilon: 0.001 } }
        }
        contentItem: Text { text: "play"; color: "#000000"
            horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
    }
}