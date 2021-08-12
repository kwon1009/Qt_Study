import QtQuick 2.0

Item {
    // signals
    signal sg_start();
    signal sg_finish();

    //slots
    function slot_move() {
        airplane.x += 0.5
        airplane.y += 0.2
        if(airplane.x >= parent.width || airplane.y >= parent.height) {
            console.log("finish")
            sg_finish();
        }
    }

    Rectangle {
        id: airplane
        width: 50
        height: 50
        color: "yellow"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("MyAirplane.qml: airplane click")
                sg_start();
            }
        }
    }
}
