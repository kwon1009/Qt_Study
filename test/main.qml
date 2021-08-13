import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

Window {
    width: 1000
    height: 400
    visible: true

    Rectangle {
        id: rec1Race
        objectName: "rec1Race"
        width: parent.width
        height: 200
        border.color: "gray"
        border.width: 1

        Rectangle {
            id: rec1
            height: 100
            width: 100
            x: 0
            y: 50
            color: "Violet"
            radius: 50
        }

        // slots
        function slot_setXY(x, y) {
            rec1.x = x
            rec1.y = y
        }
    }

    Rectangle {
        id: rec2Race
        objectName: "rec2Race"
        anchors.top: rec1Race.bottom
        width: parent.width
        height: 200
        border.color: "gray"
        border.width: 1

        Rectangle {
            id: rec2
            height: 100
            width: 100
            x: 0
            y: 50
            color: "darkblue"
            radius: 50
        }

        // slots
        function slot_setXY(x, y) {
            rec2.x = x
            rec2.y = y
        }
    }

    // signals
    signal sg_start();

    Item {
        objectName: "startBtn"
        anchors.fill: parent
        visible: true


        Button {
            anchors.centerIn: parent
            width: 60
            height: 30
            text: "Start"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("main.qml: startBtn click.")
                parent.visible = false
                sg_start()
            }
        }
    }
}
