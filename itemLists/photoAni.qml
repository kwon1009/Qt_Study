import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Window 2.12
import QtQml 2.1
import QtQuick.Layouts 1.3

import Connector 1.0
import "./components"
import "./src"

// secondView

Item {
    property int mMaxWidth: 300
    property int mMaxHeight: 500
    property bool mIsForward: true

    Rectangle {
        id: photoBox
        width: 100
        height : 100
        x: 0
        y: 0
        color: "black"

        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            source: mPhotoPath
        }
    }


    // buttons
    Item {
        anchors.fill: parent

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 3

            Button {
                id: backBtn;
                text: "Back"
                onClicked: {
                    // 타이머 종료 및 화면 전환
                    sg_stopTimer()
                    time = 0
                    firstView.visible = true
                    secondView.visible = false  // secondView
                }
            }

            Button {
                id: oneTime;
                text: "One Time"
                onClicked: {
                    console.log("photoAni.qml one time btn click.")
                    console.log("photoBox x y:", photoBox.x, photoBox.y)

                    if(photoBox.y == 0 & photoBox.x < mMaxWidth) {
                        console.log("Forward photoBox is side1")
                        forward_side1.running = !forward_side1.running
                        backward_side1.running = !backward_side1.running
                    } else if(photoBox.x == mMaxWidth && photoBox.y < mMaxHeight) {
                        console.log("Forward photoBox is side 2")
                        forward_side2.running = !forward_side2.running
                        backward_side2.running = !backward_side2.running
                    } else if(photoBox.y == mMaxHeight && photoBox.x < mMaxWidth) {
                        console.log("Forward photoBox is side3")
                        forward_side3.running = !forward_side3.running
                        backward_side3.running = !backward_side3.running
                    } else {
                        console.log("Forward photoBox is side4")
                        forward_side4.running = !forward_side4.running
                        backward_side4.running = !backward_side4.running
                    }
                }
            }

            Button {
                id: infinity;
                text: "Infinity"
                onClicked: {
                    console.log("photoAni.qml infinity btn click.")
                    sg_infiReverse()    // timer 시작
                    // !!멈추게 하는 법?
                }
            }
        }
    }

    // forward
    NumberAnimation {
        id: forward_side1
        running: true
        target: photoBox
        property: "x"
        to : mMaxWidth
        duration: (mMaxWidth-photoBox.x)*10
        onFinished: {
            console.log("forward_side1 finish")
            forward_side2.running = true
        }
    }

    NumberAnimation {
        id: forward_side2
        target: photoBox
        property: "y"
        to : mMaxHeight
        duration: (mMaxHeight-photoBox.y)*10
        onFinished: {
            console.log("forward_side2 finish")
            forward_side3.running = true
        }
    }

    NumberAnimation {
        id: forward_side3
        target: photoBox
        property: "x"
        to : 0
        duration: photoBox.x*10
        onFinished: {
            console.log("forward_side3 finish")
            forward_side4.running = true
        }
    }

    NumberAnimation {
        id: forward_side4
        target: photoBox
        property: "y"
        to : 0
        duration: photoBox.y*10
        onFinished: {
            console.log("forward_side4 finish")
            forward_side1.running = true
        }
    }

    // backward
    NumberAnimation {
        id: backward_side1
        target: photoBox
        property: "x"
        to : 0
        duration: photoBox.x*10
        onFinished: {
            console.log("backward_side1 finish")
            backward_side4.running = true
        }
    }

    NumberAnimation {
        id: backward_side2
        target: photoBox
        property: "y"
        to : 0
        duration: photoBox.y*10
        onFinished: {
            console.log("backward_side2 finish")
            backward_side1.running = true
        }
    }

    NumberAnimation {
        id: backward_side3
        target: photoBox
        property: "x"
        to : mMaxWidth
        duration: (mMaxWidth-photoBox.x)*10
        onFinished: {
            console.log("backward_side3 finish")
            backward_side2.running = true
        }
    }

    NumberAnimation {
        id: backward_side4
        target: photoBox
        property: "y"
        to : mMaxHeight
        duration: (mMaxHeight-photoBox.y)*10
        onFinished: {
            console.log("backward_side4 finish")
            backward_side3.running = true
        }
    }
}
