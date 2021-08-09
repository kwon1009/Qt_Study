import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

import Connector 1.0
import "."

Window {
    // !!공통 소스 폴더를 만들기
    property int mSpacing: 6        // 배치할 버튼 수
    property var mPhotoPaths: []    // 이미지 모음. 동적할당
    property var mXs: []            // 좌표 모음. 동적 할당
    property var mBtns: []          // 현재 위치별 버튼들

    id: mainWindow
    width: 1000
    height: 400
    visible: true

    Connector { id: connector }

    Component.onCompleted: {
        // 이미지 파일 설정
        mPhotoPaths = connector.getImagePaths()
        console.log("mPhotoPaths setting complete.")

        // 기준 좌표 설정
        var w = mainWindow.width/mSpacing
        for(var i=0; i<mSpacing; i++) {
            mXs[i] = w*i
        }
        console.log("mXs setting complete.")
    }

    Item {
        anchors.fill: parent
        Component.onCompleted: {
            for(var i=0; i<mSpacing; i++) {
                var component = Qt.createComponent("MyButton.qml")
                var btn = component.createObject(parent, {
                                           position: i,
                                           photoPath: mPhotoPaths[i],
                                           x: parent.width/mSpacing * i,
                                           y: parent.height/2 - height/2
                                         });
                mBtns.push(btn)
                console.log("conponent:", i, btn.photoPath)
            }
            console.log("MyButton component setting complete.")
        }   // !!빈 이미지 하나가 추가로 생성됨
        // !!로그 작성하여 빈 이미지가 어디서 발생하는지 확인해보기

        Component {
            id: myBtnComponent
            MyButton {}
        }
        Loader { id: myBtnLoader; sourceComponent: myBtnComponent }
    }

    Button {
        id: saveBtn
        width: 300
        height: 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Save"

        onClicked: {
            console.log(myBtnLoader.loaded())
        }
    }
}
