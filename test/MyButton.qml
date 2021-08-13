import QtQuick 2.0

Rectangle {
    property var mRecColor: ""
    property var mName: ""

    width: parent.width
    height: parent.height //100

    Rectangle {
        height: parent.height
        width: 5
        color: "#FFEE58"
        anchors.right: goalRange.left
    }

    Rectangle {
        id: goalRange
        height: parent.height
        width: 50
        color: "white" //"#F44336"
        anchors.right: parent.right
    }

    Rectangle {
        id: rec
        height: 50
        width: 50
        x: 0
        y: 15
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

    Rectangle {
        id: border
        width: parent.width
        height: 1
        color: "gray"
        anchors.bottom: parent.bottom
    }
}
