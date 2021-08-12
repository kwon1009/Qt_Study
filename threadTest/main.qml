import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Window {
    width: 400
    height: 600
    visible: true
    title: qsTr("Hello World")

    // signals
    signal sg_clkStartBtn1();
    signal sg_clkStopBtn1();
    signal sg_clkResetBtn1();

    signal sg_clkStartBtn2();
    signal sg_clkStopBtn2();
    signal sg_clkResetBtn2();

    // slots
    function slot_thisTime1(thisTime) {
        showTime1Txt.text = thisTime
    }

    function slot_thisTime2(thisTime) {
        showTime2Txt.text = thisTime
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 2

        // timer1
        Rectangle {
            id: chk1
            Layout.fillHeight: true
            Layout.preferredWidth: 100

            // display1
            Rectangle {
                id: showTime1
                width: 180
                height: 40
                border.color: "gray"
                border.width: 1
                Text {
                    id: showTime1Txt
                    text: ""
                    anchors.centerIn: parent
                }
            }

            Button {
                id: startBtn1
                anchors.top: showTime1.bottom
                anchors.topMargin: 10
                width: 80
                height: 40
                text: "Start 1"
                onClicked: {
                    console.log("main.qml: startBtn1 clicked.")
                    sg_clkStartBtn1()
                }
            }

            Button {
                id: stopBtn1
                anchors.top: startBtn1.bottom
                anchors.topMargin: 10
                width: 80
                height: 40
                text: "Stop 1"
                onClicked: {
                    console.log("main.qml: stopBtn1 clicked.")
                    sg_clkStopBtn1()
                }
            }

            Button {
                id: resetBtn1
                anchors.top: stopBtn1.bottom
                anchors.topMargin: 10
                width: 80
                height: 40
                text: "Reset 1"
                onClicked: {
                    console.log("main.qml: resetBtn1 clicked.")
                    sg_clkResetBtn1()
                }
            }
        }

        // timer2
        Rectangle {
            id: chk2
            Layout.fillHeight: true
            Layout.preferredWidth: 100
            Rectangle {
                id: showTime2
                width: 180
                height: 40
                border.color: "gray"
                border.width: 1
                Text {
                    id: showTime2Txt
                    text: ""
                    anchors.centerIn: parent
                }
            }

            Button {
                id: startBtn2
                anchors.top: showTime2.bottom
                anchors.topMargin: 10
                width: 80
                height: 40
                text: "Start 2"
                onClicked: {
                    console.log("main.qml: startBtn2 clicked.")
                    showTime2Txt.text = 0
                    sg_clkStartBtn2()
                }
            }

            Button {
                id: stopBtn2
                anchors.top: startBtn2.bottom
                anchors.topMargin: 10
                width: 80
                height: 40
                text: "Stop 2"
                onClicked: {
                    console.log("main.qml: stopBtn2 clicked.")
                    sg_clkStopBtn2()
                }
            }

            Button {
                id: resetBtn2
                anchors.top: stopBtn2.bottom
                anchors.topMargin: 10
                width: 80
                height: 40
                text: "Reset 1"
                onClicked: {
                    console.log("main.qml: resetBtn1 clicked.")
                    sg_clkResetBtn2()
                }
            }
        }
    }

}
