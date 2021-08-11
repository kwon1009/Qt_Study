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
    property int mSide: 1

    // signals
    // timer control
    signal sg_startTimer();
    signal sg_stopTimer();

    // slots
    // 5초마다 해당 timer 호출, 방향 전환
    function slot_timer() {
        checkDirection()
        console.log("main.qml time out, reverse direction")
    }

    // start animation
    function slot_startAni(photoPath) {
        // 설정 초기화 및 애니메이션 시작
        photoBoxImg.source = photoPath
        mSide = 1
        photoBox.x = 0
        photoBox.y = 0
        forward_side1.running = true
        console.log("photoAni.qml: start Animation")
    }

    // functions
    function checkDirection() {
        switch(mSide) {
        case 1:
            console.log("photoBox is side1")
            forward_side1.running = !forward_side1.running
            backward_side1.running = !backward_side1.running
            break;

        case 2:
            console.log("photoBox is side 2")
            forward_side2.running = !forward_side2.running
            backward_side2.running = !backward_side2.running
            break;

        case 3:
            console.log("photoBox is side3")
            forward_side3.running = !forward_side3.running
            backward_side3.running = !backward_side3.running
            break;

        case 4:
            console.log("photoBox is side4")
            forward_side4.running = !forward_side4.running
            backward_side4.running = !backward_side4.running
            break;
        }
    }

    function stopAnimation() {
        switch(mSide) {
        case 1:
            console.log("Stop photoBox is side1")
            forward_side1.running = false
            backward_side1.running = false
            break;

        case 2:
            console.log("Stop photoBox is side 2")
            forward_side2.running = false
            backward_side2.running = false
            break;

        case 3:
            console.log("Stop photoBox is side3")
            forward_side3.running = false
            backward_side3.running = false
            break;

        case 4:
            console.log("Stop photoBox is side4")
            forward_side4.running = false
            backward_side4.running = false
            break;
        }
    }

    // moving photobox
    Rectangle {
        id: photoBox
        width: 100
        height : 100
        x: 0
        y: 0
        color: "black"

        Image {
            id: photoBoxImg
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
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
                    // 타이머 종료
                    sg_stopTimer()
                    // 현재 진행중인 이벤트 종료
                    stopAnimation()

                    // 화면 전환
                    firstView.visible = true
                    secondView.visible = false
                }
            }

            Button {
                id: oneTime;
                text: "Reverse"
                onClicked: {
                    sg_stopTimer()      // 타이머 종료
                    console.log("photoAni.qml timer stop")

                    checkDirection()
                    console.log("photoAni.qml one time btn click.")
                }
            }

            Button {
                id: infinity;
                text: "Infinity"
                onClicked: {
                    console.log("photoAni.qml infinity btn click.")
                    console.log("photoAni.qml setting photoBox.")
                    mPhotoBox = photoBox
                    checkDirection() // 변경 먼저 수행
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
            mSide = 2
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
            mSide = 3
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
            mSide = 4
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
            mSide = 1
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
            mSide = 4
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
            mSide = 1
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
            mSide = 2
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
            mSide = 3
        }
    }
}
