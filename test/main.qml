import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

//import MainWindow 1.0
//import "."

Window {
    width: 1000
    height: 400
    visible: true

//    MainWindow { id: mainWindow }

    // slots
    function slot_setText() {
        console.log("setText")//, mainWindow.getStr())
//        countRecText.text = st
    }


    Rectangle {
        id: countRec
        width: 500
        height: 50
        anchors.left: parent.left
        border.color: "gray"
        border.width: 1

        Button {
            id: countRecBtn
            text: "count"
            onClicked: {
                console.log("count btn click")
//                mainWindow.on_pushButton_clicked()
            }
        }

        Text {
            anchors.left: countRecBtn.right
            anchors.leftMargin: 15
            id: countRecText
            text: ""
        }
    }

    Button {
        id: timerStBtn
        anchors.top: countRec.bottom
        anchors.topMargin: 10
        text: "Timer Start"
        onClicked: {
            console.log("timer start btn click")
//            mainWindow.on_pushButton_timer_clicked()
        }
    }

    Button {
        id: throwBtn
        anchors.top: timerStBtn.bottom
        anchors.topMargin: 10
        text: "Throw"
        onClicked: {
            console.log("throw btn click")
//            mainWindow.on_pushButton_thread_clicked()
        }
    }
}
