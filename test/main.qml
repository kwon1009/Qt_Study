import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

Window {
    width: 1000
    height: 400
    visible: true

    property var mWinner: ""
    property var mBoxNum: 2

    // signals
    signal sg_start();

    // slots
    function slot_winner(names) {
        console.log(names);
        mWinner = names[0];
        finishTxt.text = "Finish.\nThe winner is " + mWinner
        finish.visible = true
    }

    MyButton {
        id: rec1Race
        objectName: "rec1Race"
        mRecColor: "Violet"
        mName: "A"
    }

    MyButton {
        id: rec2Race
        objectName: "rec2Race"
        mRecColor: "darkblue"
        anchors.top: rec1Race.bottom
        mName: "B"
    }

    // startBtn
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

    // finish
    Item {
        id: finish
        objectName: "finish"
        anchors.fill: parent
        visible: false

        Text {
            id: finishTxt
            anchors.centerIn: parent
            text: ""
            color: "Blue"
            font.bold: true
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
