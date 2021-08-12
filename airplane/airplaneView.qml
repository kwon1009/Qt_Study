import QtQuick 2.0

Item {
    anchors.fill: parent
    focus: true

    MyAirplane { objectName: "airplane1" }

    Keys.onPressed: {
        if(event.key == Qt.Key_Space) {
            console.log("MyAirplane.qml: key Space press");
        }
    }
}
