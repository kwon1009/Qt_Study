import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "."

Window {
    width: 1000
    height: 400
    visible: true

    Item {
        id: root

        required property string colorKey: "yellow"
        required property int modelData: 0

        width: 64; height: 64

        MouseArea {
            id: mouseArea

            width: 64; height: 64
            anchors.centerIn: parent

            drag.target: tile

            onReleased: parent = tile.Drag.target !== null ? tile.Drag.target : root

            Rectangle {
                id: tile

                width: 64; height: 64
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

                color: root.colorKey

                Drag.keys: [ root.colorKey ]
                Drag.active: mouseArea.drag.active
                Drag.hotSpot.x: 32
                Drag.hotSpot.y: 32
                states: State {
                    when: mouseArea.drag.active
                    ParentChange { target: tile; parent: root }
                    AnchorChanges { target: tile; anchors.verticalCenter: undefined; anchors.horizontalCenter: undefined }
                }

            }
        }

        DropArea {
            id: dragTarget

            property string colorKey
            property alias dropProxy: dragTarget

            width: 64; height: 64
            keys: [ colorKey ]

            Rectangle {
                id: dropRectangle

                anchors.fill: parent
                color: dragTarget.colorKey

                states: [
                    State {
                        when: dragTarget.containsDrag
                        PropertyChanges {
                            target: dropRectangle
                            color: "grey"
                        }
                    }
                ]
            }
        }
    }
}
