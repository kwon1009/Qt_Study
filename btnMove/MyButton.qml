import QtQuick 2.0
import QtQuick.Controls 2.12
import "."

Rectangle {
    property int btnNo: 0
    property string photoPath: ""

    width: 200
    height: 200
    color: "gray"

    Drag.active: dragArea.drag.active
    Drag.hotSpot.x: parent.width/2
    Drag.hotSpot.y: parent.height/2

    Image {
        fillMode: Image.PreserveAspectCrop
        source: photoPath
        width: 100
        height: 100
        // !!이미지가 붙어 있도록 해야 함
        // !!parent로 할 시, 이미지가 분리됨
    }

    MouseArea {
        id: dragArea
        anchors.fill: parent
        drag.target: parent

        onEntered: {
            parent.color = "yellow"
        }

        onExited: {
            parent.color = "gray"
        }
    }
}
