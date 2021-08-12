import QtQuick 2.12
import QtQuick.Window 2.12
import "."

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Airplane")

    Item {
        id: airplaneView
        anchors.fill: parent
        focus: true

        MyAirplane { objectName: "airplane1" }

        Keys.onPressed: {
            if(event.key == Qt.Key_Space) {
                console.log("MyAirplane.qml: key Space press");
            }
        }
    }
}
