import QtQuick 2.0

Item {
    id: airplane

    //slots
    function slot_move() {
        console.log("time")
    }

    Rectangle {
        width: 50
        height: 50
        color: "yellow"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("MyAirplane.qml: airplane click")
            }
        }
    }
}
