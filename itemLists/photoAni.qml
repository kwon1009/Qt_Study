import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Window 2.12
import QtQml 2.1
import Connector 1.0
import "."


Rectangle {
    id: base
    width: 400
    height : 600
    color: "white"

    Image {
        id: photoBox
        source: mPhotoPath      // main.qml에서 받은 값
        width: 100
        height: 100
        x : 0
        y : 0

        SequentialAnimation {
            running: true
            loops: Animation.Infinite;

            // 도착지점을 현재 화면 사이즈에 맞게 자동으로 조절되도록 하기
            NumberAnimation {
                target: photoBox
                property: "x"
                from : 0
                to : 300
                duration: 3000
            }

            NumberAnimation {
                target: photoBox
                property: "y"
                from : 0
                to : 500
                duration: 5000
            }

            NumberAnimation {
                target: photoBox
                property: "x"
                from : 300
                to : 0
                duration: 3000
            }

            NumberAnimation {
                target: photoBox
                property: "y"
                from : 500
                to : 0
                duration: 5000
            }
        }
    }

    Button {
        id: backBtn
        width: 70
        height: 30
        x: parent.width/2-35
        y: parent.height/2-15
        text: "Back"
        onClicked: {
            stackPhotoAni.pop()
        }
    }
}
