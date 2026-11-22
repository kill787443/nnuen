// components/NavButton.qml
import QtQuick
import QtQuick.Controls.Basic

TabButton {
    id: root
    property string iconName: "home"
    checkable: pillHover.hovered

    FontLoader {
        id: materialFont
        source: "../ms.ttf"
    }

    background: Item {}

    contentItem: Column {
        spacing: 4
        anchors.centerIn: parent

        Rectangle {
            id: pill
            width: root.checked ? 64 : (pillHover.hovered ? 48 : 32)
            height: 32
            radius: 16
            anchors.horizontalCenter: parent.horizontalCenter

            // Use pillHover.hovered instead of root.hovered!
            color: root.checked ? "#4A4458"
                 : (pillHover.hovered ? "#2B2930" : "transparent")

            // 1. Smoothly animate both width and color!
            Behavior on width { SpringAnimation { spring: 3; damping: 0.25 } }
            Behavior on color { ColorAnimation { duration: 150 } }

            // 2. Only detects hover directly over the pill itself
            HoverHandler {
                id: pillHover
            }

            Text {
                anchors.centerIn: parent
                text: root.iconName
                font.family: materialFont.name
                font.pixelSize: 24
                color: root.checked ? "#E8DEF8" : "#CAC4D0"

                Behavior on color { ColorAnimation { duration: 150 } }
            }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: root.text
            font.pixelSize: 12
            color: root.checked ? "#E6E0E9" : "#CAC4D0"

            Behavior on color { ColorAnimation { duration: 150 } }
        }
    }
}
