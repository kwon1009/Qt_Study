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
    property int mMaxWidth: photoWindow.width - photoBox.width
    property int mMaxHeight: photoWindow.height - photoBox.height
    property bool mIsForward: true
    property var mForwards: [aniForSide1, aniForSide2, aniForSide3, aniForSide4]
    property var mBackwards: [aniBackSide1, aniBackSide2, aniBackSide3, aniBackSide4]

    Rectangle {
        id: photoWindow
        width: 400
        height : 600
        color: "white"

        Image {
            id: photoBox
            fillMode: Image.PreserveAspectCrop
            source: mPhotoPath      // main.qml에서 받은 값
            width: 100
            height: 100
            x : 0
            y : 0
        }

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
                        for(var i=0; i<4; i++) {
                            if(mForwards[i].running == true) {
                                mForwards[i].running = false
                            }
                            if(mBackwards[i].running == true) {
                                mBackwards[i].running = false
                            }
                            console.log(i, "change all false")
                        }

                        if(mIsForward) {
                            if(photoBox.y == 0 & photoBox.x < mMaxWidth) {
                                console.log("Forward photoBox is side1")
                                mBackwards[0].running = true
                            } else if(photoBox.x == mMaxWidth && photoBox.y < mMaxHeight) {
                                console.log("Forward photoBox is side 2")
                                mBackwards[1].running = true
                            } else if(photoBox.y == mMaxHeight && photoBox.x < mMaxWidth) {
                                console.log("Forward photoBox is side3")
                                mBackwards[2].running = true
                            } else {
                                console.log("Forward photoBox is side4")
                                mBackwards[3].running = true
                            }
                            mIsForward = !mIsForward

                        } else {
                            if(photoBox.y == 0 & photoBox.x < mMaxWidth) {
                                console.log("Backward photoBox is side1")
                                mForwards[0].running = true
                            } else if(photoBox.x == mMaxWidth && photoBox.y < mMaxHeight) {
                                console.log("Backward photoBox is side 2")
                                mForwards[1].running = true
                            } else if(photoBox.y == mMaxHeight && photoBox.x < mMaxWidth) {
                                console.log("Backward photoBox is side3")
                                mForwards[2].running = true
                            } else {
                                console.log("Backward photoBox is side4")
                                mForwards[3].running = true
                            }
                            mIsForward = !mIsForward
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

        // forward side
        SequentialAnimation {
            id: aniForSide1
            running: true
            loops: Animation.Infinite
            animations: [
                forward_side1,
                forward_side2,
                forward_side3,
                forward_side4
            ]
        }

        SequentialAnimation {
            id: aniForSide2
            running: false
            loops: Animation.Infinite
            animations: [
                forward_side2,
                forward_side3,
                forward_side4,
                forward_side1
            ]
        }

        SequentialAnimation {
            id: aniForSide3
            running: false
            loops: Animation.Infinite
            animations: [
                forward_side3,
                forward_side4,
                forward_side1,
                forward_side2
            ]
        }

        SequentialAnimation {
            id: aniForSide4
            running: false
            loops: Animation.Infinite
            animations: [
                forward_side4,
                forward_side1,
                forward_side2,
                forward_side3
            ]
        }

        // backward side
        SequentialAnimation {
            id: aniBackSide1
            running: false
            loops: Animation.Infinite
            animations: [
                backward_side1,
                backward_side4,
                backward_side3,
                backward_side2
            ]
        }

        SequentialAnimation {
            id: aniBackSide2
            running: false
            loops: Animation.Infinite
            animations: [
                backward_side2,
                backward_side1,
                backward_side4,
                backward_side3
            ]
        }

        SequentialAnimation {
            id: aniBackSide3
            running: false
            loops: Animation.Infinite
            animations: [
                backward_side3,
                backward_side2,
                backward_side1,
                backward_side4
            ]
        }

        SequentialAnimation {
            id: aniBackSide4
            running: false
            loops: Animation.Infinite
            animations: [
                backward_side4,
                backward_side3,
                backward_side2,
                backward_side1
            ]
        }

        // forward
        NumberAnimation {
            id: forward_side1
            target: photoBox
            property: "x"
            to : mMaxWidth
            duration: 3000
        }

        NumberAnimation {
            id: forward_side2
            target: photoBox
            property: "y"
            to : mMaxHeight
            duration: 5000
        }

        NumberAnimation {
            id: forward_side3
            target: photoBox
            property: "x"
            to : photoWindow.x
            duration: 3000
        }

        NumberAnimation {
            id: forward_side4
            target: photoBox
            property: "y"
            to : photoWindow.y
            duration: 5000
        }

        // backward
        NumberAnimation {
            id: backward_side1
            target: photoBox
            property: "x"
            to : photoWindow.x
            duration: 3000
        }

        NumberAnimation {
            id: backward_side2
            target: photoBox
            property: "y"
            to : photoWindow.y
            duration: 5000
        }

        NumberAnimation {
            id: backward_side3
            target: photoBox
            property: "x"
            to : mMaxWidth
            duration: 3000
        }

        NumberAnimation {
            id: backward_side4
            target: photoBox
            property: "y"
            to : mMaxHeight
            duration: 5000
        }
    }
}
