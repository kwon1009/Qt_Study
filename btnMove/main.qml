import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

import Connector 1.0
import "."

Window {
    // !!공통 소스 폴더를 만들기
    // !!자동으로 사진 받아오도록 함
    property var mPhotoPaths: []    // 이미지 모음
    property var mXs: []            // 좌표 모음
    property int mSpacing: 6        // 배치할 버튼 수
    property var mBtns: []  // 현재 위치별 버튼들

    id: mainWindow
    width: 1000
    height: 400
    visible: true

    Connector { id: connector }

    Component.onCompleted: {
        // 이미지 파일 설정
        mPhotoPaths = connector.getImages()

        // 기준 좌표 설정
        var w = mainWindow.width/mSpacing
        for(var i=0; i<mSpacing; i++) {
            mXs[i] = w*i
        }
    }

    Item {
        anchors.fill: parent
        Component.onCompleted: {
            for(var i=0; i<mSpacing; i++) {
                var component = Qt.createComponent("MyButton.qml")
                component.createObject(parent, {
                                     position: i,
                                     photoPath: mPhotoPaths[i],
                                     x: parent.width/mSpacing * i,
                                     y: parent.height/2 - height/2
                                 });
                mBtns.push(component)
            }
        }

        Component {
            id: myBtnComponent
            MyButton { id: btn }
        }
        Loader { sourceComponent: myBtnComponent }
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
