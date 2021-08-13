import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import Connector 1.0

Window {
    width: 1000
    height: 500
    visible: true

    property var mBoxs: []

    property var mWinner: ""
    property var mBoxNum: 5
    property var mObjNames:[]
    property var mColors: []
    property var mNames: []

    Connector { id: connector }

    // signals
    signal sg_start();
    signal sg_pressSpace();

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

    ColumnLayout {
        id: raceView
        anchors.fill: parent
        spacing: 5
        focus: true

        Keys.onPressed: {
            if(event.key == Qt.Key_Space) {
                console.log("main.qml: key Space press");
//                sg_pressSpace();
            }

            if(event.key == Qt.Key_L) {
                console.log("main.qml: key L press");
            }

            if(event.key == Qt.Key_Enter) {
                console.log("main.qml: key Enter press");
            }

            if(event.key == Qt.Key_Left) {
                console.log("main.qml: key Left press");
            }
        }

        MyButton {
            id: rec1Race
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.height/mBoxNum
            objectName: mObjNames[0]
            mRecColor: mColors[0]
            mName: mNames[0]
        }

        MyButton {
            id: rec2Race
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.height/mBoxNum
            objectName: mObjNames[1]
            mRecColor: mColors[1]
            mName: mNames[1]
        }

        MyButton {
            id: rec3Race
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.height/mBoxNum
            objectName: mObjNames[2]
            mRecColor: mColors[2]
            mName: mNames[2]
        }

        MyButton {
            id: rec4Race
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.height/mBoxNum
            objectName: mObjNames[3]
            mRecColor: mColors[3]
            mName: mNames[3]
        }

        MyButton {
            id: rec5Race
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.height/mBoxNum
            objectName: mObjNames[4]
            mRecColor: mColors[4]
            mName: mNames[4]
        }
    }


    // startBtn
    Item {
        id: startBtn
        objectName: "startBtn"
        anchors.centerIn: parent
        visible: true
        focus: false

        Button {
            width: 60
            height: 30
            text: "Start"
            onClicked: {
                console.log("main.qml: startBtn click.")
                startBtn.visible = false
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
