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
    function boxAni() {
        photoBox.x++
    }

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
                        stackPhotoAni.pop()
                    }
                }

                Button {
                    id: oneTime;
                    text: "One Time"
                    onClicked: {
                        boxAni()
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

//        SequentialAnimation {
//            id: forward
//            running: true

//            NumberAnimation {
//                id: forward1
//                target: photoBox
//                property: "x"
//                from : parent.x
//                to : photoWindow.width - photoBox.width
//                duration: 3000
//            }

//            NumberAnimation {
//                id: forward2
//                target: photoBox
//                property: "y"
//                from : parent.y
//                to : photoWindow.height - photoBox.height
//                duration: 5000
//            }

//            NumberAnimation {
//                id: forward3
//                target: photoBox
//                property: "x"
//                from : photoWindow.width - photoBox.width
//                to : parent.x
//                duration: 3000
//            }

//            NumberAnimation {
//                id: forward4
//                target: photoBox
//                property: "y"
//                from : photoWindow.height - photoBox.height
//                to : parent.y
//                duration: 5000
//            }
//        }

        // backword animation
//        SequentialAnimation {
//            id: backward
//            running: false
//            loops: Animation.Infinite;

//            NumberAnimation {
//                id: backward1
//                target: photoBox
//                property: "y"
//                from : parent.y
//                to : photoWindow.height - photoBox.height
//                duration: 5000
//            }

//            NumberAnimation {
//                id: backward2
//                target: photoBox
//                property: "x"
//                from : parent.x
//                to : photoWindow.width - photoBox.width
//                duration: 3000
//            }

//            NumberAnimation {
//                id: backward3
//                target: photoBox
//                property: "y"
//                from : photoWindow.height - photoBox.height
//                to : parent.y
//                duration: 5000
//            }

//            NumberAnimation {
//                id: backward4
//                target: photoBox
//                property: "x"
//                from : photoWindow.width - photoBox.width
//                to : parent.x
//                duration: 3000
//            }
//        }
    }
}
