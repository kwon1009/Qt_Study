import QtQuick 2.0

Item {
    id: airplaneView
    objectName: "airplaneView"
    anchors.fill: parent
    focus: true

    // signals
    signal sg_pressSpace();
    signal sg_pressEnter();

    // slots
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

    Keys.onPressed: {
        if(event.key == Qt.Key_Space) {
            console.log("airplaneView.qml: key Space press");
            sg_pressSpace();
        }

        if(event.key == Qt.Key_Enter) {
            console.log("airplaneView.qml: key Enter press");
            sg_pressEnter();
        }
    }
}
