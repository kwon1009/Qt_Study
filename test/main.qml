import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import Connector 1.0

Window {
    width: 1000
    height: 500
    visible: true

    property var mWinner: ""
    property var mBoxNum: 5
    property var mObjNames:[]
    property var mColors: []
    property var mNames: []

    Connector { id: connector }

    // signals
    signal sg_start();

    // slots
    function slot_winner(names) {
        console.log(names);
        finishTxt.text = "Finish.\nThe winner is " + names[0]
        var rankStr = ""
        for(var i=0; i<mBoxNum; i++) {
            rankStr = rankStr + "Rank " + (i+1) + ". " + names[i] + "\n"
        }
        rankTxt.text = rankStr
        finish.visible = true
    }

    Component.onCompleted: {
        mObjNames = connector.getObjNames()
        mNames = connector.getNames()
        mColors = connector.getColors()
    }

    MyButton {
        id: rec1Race
        objectName: mObjNames[0]
        mRecColor: mColors[0]
        mName: mNames[0]
    }

    MyButton {
        id: rec2Race
        objectName: mObjNames[1]
        mRecColor: mColors[1]
        anchors.top: rec1Race.bottom
        mName: mNames[1]
    }

    MyButton {
        id: rec3Race
        objectName: mObjNames[2]
        mRecColor: mColors[2]
        anchors.top: rec2Race.bottom
        mName: mNames[2]
    }

    MyButton {
        id: rec4Race
        objectName: mObjNames[3]
        mRecColor: mColors[3]
        anchors.top: rec3Race.bottom
        mName: mNames[3]
    }

    MyButton {
        id: rec5Race
        objectName: mObjNames[4]
        mRecColor: mColors[4]
        anchors.top: rec4Race.bottom
        mName: mNames[4]
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

        Button {
            text: "Retry"
            anchors.bottom: finishTxt.top
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                sg_start()
                finish.visible = false
            }
        }

        Text {
            id: finishTxt
            anchors.centerIn: parent
            text: ""
            color: "Blue"
            font.bold: true
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: rankTxt
            anchors.top: finishTxt.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            text: ""
            font.bold: true
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
