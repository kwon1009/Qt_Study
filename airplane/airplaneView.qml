import QtQuick 2.0

Item {
    id: airplaneView
    objectName: "airplaneView"
    anchors.fill: parent

    //slots
    function slot_setXY(x, y) {
        console.log("setXY", x, y)
    }

    Rectangle {
        id: airplane
        width: 50
        height: 50
        color: "yellow"
    }
}
