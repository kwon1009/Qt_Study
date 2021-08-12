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

    signal sg_clkStartBtn2();
    signal sg_clkStopBtn2();

    // slots
    property var time1: [0, 0]; // 분:초
    function slot_showTime1() {
        time1[1]++
        if(time1[1] == 60) {
            time1[0]++
            time1[1] = 0
        }

        console.log("main.qml: time1 is", time1)

        var thisTime;
        if(time1[0] < 10) {
            thisTime = "0"
        }
        thisTime = thisTime + time1[0] + ":"

        if(time1[1] < 10) {
            thisTime += "0"
        }
        thisTime += time1[1]

        showTime1Txt.text = thisTime
    }

    property var time2: 0;
    function slot_showTime2() {
        time2++
        console.log("main.qml: time2 is", time2)
        showTime2Txt.text = time2
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
                    showTime1Txt.text = "00:00"
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
                    sg_clkStopBtn1()    // 타이머 종료
                    showTime1Txt.text = ""  // 텍스트 초기화
                    time1 = [0, 0]
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
                    showTime2Txt.text = 0
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
                    sg_clkStopBtn2()    // 타이머 종료
                    showTime2Txt.text = ""  // 텍스트 초기화
                    time2 = 0
                }
            }
        }
    }

}
