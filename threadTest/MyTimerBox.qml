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

    // slots
    function slot_thisTime(thisTime) {
        showTimeTxt.text = thisTime
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
            text: "--:--"
            anchors.centerIn: parent
        }
    }

    // buttons
    Button {
        id: startBtn
        anchors.top: showTime.bottom
        anchors.topMargin: 10
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
