import QtQuick 2.0

Item {
    id: airplaneView
    objectName: "airplaneView"
    anchors.fill: parent

    //slots
    function slot_setXY(x, y) {
        airplane.x = x
        airplane.y = y
    }

    Rectangle {
        id: airplane
        width: 50
        height: 50
        radius: 25
        color: "Violet"
    }
}
