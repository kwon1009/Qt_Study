import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

import Connector 1.0
import "."

Window {
    // !!공통 소스 폴더를 만들기
    property var mPhotoPaths: []    // 이미지 모음
    property var mXs: []            // 좌표 모음
    property int mSpacing: 0        // 분할 횟수
    property var mBtns: [btn0, btn1, btn2, btn3, btn4, btn5]  // 현재 위치별 버튼들

    Connector { id: connector }

    id: mainWindow
    width: 1000
    height: 400
    visible: true

    Component.onCompleted: {
        mSpacing = connector.getSpacingSize()

        // 이미지 파일 설정
        mPhotoPaths = connector.getImages()

        // 기준 좌표 설정
        var w = mainWindow.width/mSpacing
        for(var i=0; i<mSpacing; i++) {
            mXs[i] = w*i
        }
    }

    // !!동적으로 배정되도록 하기
    MyButton {
        id: btn0
        position: 0
        photoPath: mPhotoPaths[0]
        x: parent.width/mSpacing * 0
        y: parent.height/2 - height/2
    }

    MyButton {
        id: btn1
        position: 1
        photoPath: mPhotoPaths[1]
        x: parent.width/mSpacing * 1
        y: parent.height/2 - height/2
    }

    MyButton {
        id: btn2
        position: 2
        photoPath: mPhotoPaths[2]
        x: parent.width/mSpacing * 2
        y: parent.height/2 - height/2
    }

    MyButton {
        id: btn3
        position: 3
        photoPath: mPhotoPaths[3]
        x: parent.width/mSpacing * 3
        y: parent.height/2 - height/2
    }

    MyButton {
        id: btn4
        position: 4
        photoPath: mPhotoPaths[4]
        x: parent.width/mSpacing * 4
        y: parent.height/2 - height/2
    }

    MyButton {
        id: btn5
        position: 5
        photoPath: mPhotoPaths[5]
        x: parent.width/mSpacing * 5
        y: parent.height/2 - height/2
    }


    Button {
        id: saveBtn
        width: 300
        height: 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Save"
    }
}
