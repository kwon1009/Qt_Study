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
    objectName: "secondView"
    property int mMaxWidth: 300
    property int mMaxHeight: 500
    property bool mIsForward: true

    // 테스트용
    function slot_startAni() {
        console.log("photoAni.qml: start Animation")
        forward_side1.running = true
    }

    signal sg_test();

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

        function checkDirection(x, y) {
            if(y == 0 & x < mMaxWidth) {
                console.log("Forward photoBox is side1")
                forward_side1.running = !forward_side1.running
                backward_side1.running = !backward_side1.running

            } else if(x == mMaxWidth && y < mMaxHeight) {
                console.log("Forward photoBox is side 2")
                forward_side2.running = !forward_side2.running
                backward_side2.running = !backward_side2.running

            } else if(y == mMaxHeight && x < mMaxWidth) {
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
                    firstView.visible = true
                    secondView.visible = false
                }
            }

            Button {
                id: oneTime;
                text: "Reverse"
                onClicked: {
                    console.log("photoAni.qml timer stop")
                    sg_stopTimer()      // 타이머 종료

                    console.log("photoAni.qml one time btn click.")
                    console.log("photoAni.qml photoBox x y:", photoBox.x, photoBox.y)
                    photoBox.checkDirection(photoBox.x, photoBox.y)

                    sg_test()
                }
            }

            Button {
                id: infinity;
                text: "Infinity"
                onClicked: {
                    console.log("photoAni.qml infinity btn click.")
                    console.log("photoAni.qml setting photoBox.")
                    mPhotoBox = photoBox
                    photoBox.checkDirection(photoBox.x, photoBox.y) // 변경 먼저 수행
                    sg_startTimer()     // 타이머 시작
                }
            }
        }
    }

    // 각 변마다 애니메이션 구현
    // forward
    NumberAnimation {
        id: forward_side1
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
