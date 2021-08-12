import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

// MyTimerBox.qml

Item {
    anchors.fill: parent

    // signals
    signal sg_clkStartBtn();
    signal sg_clkStopBtn();
    signal sg_clkResetBtn();
    signal sg_clkSaveBtn();
    signal sg_clkDelBtn();

    // slots
    function slot_thisTime(thisTime) {
        showTimeTxt.text = thisTime
    }

    function slot_showSaveTime(saveTime) {
        console.log("MyTimerBox.qml: saveTime", saveTime)
        saveBoxTxt.text = ""
        for(var i=0; i<saveTime.length; i++) {
            saveBoxTxt.text = saveBoxTxt.text + saveTime[i] + "\n"
        }
    }

    // display
    Rectangle {
        id: showTime
        width: parent.width
        height: 40
        border.color: "gray"
        border.width: 1
        Text {
            id: showTimeTxt
            text: "--:--.--"
            anchors.centerIn: parent
        }
    }

    RowLayout {
        spacing: 2
        anchors.top: showTime.bottom
        anchors.topMargin: 10
        width: parent.width

        // buttons
        Rectangle {
            Layout.fillWidth: true
            Button {
                id: startBtn
                width: 80
                height: 40
                text: "Start"
                onClicked: {
                    console.log("MyTimerBox.qml: startBtn clicked.")
                    sg_clkStartBtn()
                }
            }

            Button {
                id: stopBtn
                anchors.top: startBtn.bottom
                anchors.topMargin: 10
                width: 80
                height: 40
                text: "Stop"
                onClicked: {
                    console.log("MyTimerBox.qml: stopBtn clicked.")
                    sg_clkStopBtn()
                }
            }

            Button {
                id: resetBtn
                anchors.top: stopBtn.bottom
                anchors.topMargin: 10
                width: 80
                height: 40
                text: "Reset"
                onClicked: {
                    console.log("MyTimerBox.qml: resetBtn clicked.")
                    sg_clkResetBtn()
                }
            }
        }

        // save
        Rectangle {
            Layout.fillWidth: true
            Button {
                id: saveBtn
                width: 70
                height: 40
                text: "Save"
                onClicked: {
                    console.log("MyTimerBox.qml: saveBtn clicked.")
                    sg_clkSaveBtn()
                }
            }

            Button {
                id: deleteBtn
                anchors.left: saveBtn.right
                anchors.leftMargin: 10
                width: 70
                height: 40
                text: "Delete"
                onClicked: {
                    console.log("MyTimerBox.qml: saveBtn clicked.")
                    sg_clkDelBtn()
                }
            }

            Rectangle {
                id: saveBox
                anchors.top: saveBtn.bottom
                anchors.topMargin: 10
                width: parent.width
                height: 90
                border.color: "gray"
                border.width: 1
                Text {
                    id: saveBoxTxt
                    anchors.centerIn: parent
                    text: ""
                }
            }
        }
    }
}
