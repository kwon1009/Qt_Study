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

    // slots
    function slot_showTime(time) {
        console.log("main.qml: time is", time)
        showTime1Txt.text = time
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
                }
            }
        }
    }

}
