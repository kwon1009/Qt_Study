import QtQuick 2.0

Item {
    objectName: "airplaneView"
    anchors.fill: parent
    focus: true

    // signals
    signal sg_pressSpace();
    signal sg_pressEnter();


    Rectangle {
        id: airplane1
        objectName: "airplane"
        width: 50
        height: 50
        radius: 25

        // slots
        function slot_setXY(x, y) {
            airplane1.x = x
            airplane1.y = y
        }
    }

    Rectangle {
        id: airplane2
        objectName: "airplane2"
        width: 50
        height: 50
        radius: 25
        color: "darkblue"

        // slots
        function slot_setXY(x, y) {
            airplane2.x = x
            airplane2.y = y
        }
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
