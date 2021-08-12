import QtQuick 2.0

Item {
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
        objectName: "airplane"
        width: 50
        height: 50
        radius: 25
    }

    Keys.onPressed: {
        if(event.key == Qt.Key_Space) {
            console.log("airplaneView.qml: key Space press");
            sg_pressSpace();
        }

//        if(event.key == Qt.Key_Enter) {
//            console.log("airplaneView.qml: key Enter press");
//            sg_pressEnter();
//        }
    }
}
