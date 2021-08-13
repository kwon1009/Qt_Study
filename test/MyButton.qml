import QtQuick 2.0

Rectangle {
    property var mRecColor: ""
    property var mName: ""

    width: parent.width
    height: 200
    border.color: "gray"
    border.width: 1

    Rectangle {
        id: rec
        height: 100
        width: 100
        x: 0
        y: 50
        color: mRecColor
        radius: 50

        Text {
            anchors.centerIn: parent
            text: mName
            font.bold: true
            font.pixelSize: 30
            color: "white"
        }
    }

    // slots
    function slot_setXY(x, y) {
        rec.x = x
        rec.y = y
    }
}
