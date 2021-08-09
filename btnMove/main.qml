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
        console.log("main: mPhotoPaths setting complete.")

        // 기준 좌표 설정
        var w = mainWindow.width/mSpacing
        for(var i=0; i<mSpacing; i++) {
            mXs[i] = w*i
        }
        console.log("main: mXs setting complete.")
    }

    Item {
        anchors.fill: parent
        Component.onCompleted: {
            var btnSize = 150
            for(var i=0; i<mSpacing; i++) {
                var component = Qt.createComponent("MyButton.qml")
                var btn = component.createObject(parent, {
                                           position: i,
                                           mBtnSize: btnSize,
                                           photoPath: mPhotoPaths[i],
                                           x: parent.width/mSpacing * i,
                                           y: mainWindow.height/2 - btnSize/2
                                         });
                mBtns.push(btn)
                console.log("main: component[", i, "]", component, btn)
            }
            console.log("main: MyButton component setting complete.")
        }
        // !!빈 이미지 하나가 추가로 생성됨
        // - width와 height가 MyButton.qml에 고정값으로 존재할 시, 이와 같은 오류가 발생됨

        Component {
            id: myBtnComponent
            MyButton {}
        }
        Loader { id: myBtnLoader; sourceComponent: myBtnComponent }
    }

    Item {
        anchors.horizontalCenter: parent.horizontalCenter

        Button {
            id: saveBtn
            width: 300
            height: 50
            anchors.right: reloadBtn.left
            anchors.rightMargin: 20
            text: "Save"

            onClicked: {
                var photos = []
                for(var i=0; i<mSpacing; i++) {
                    photos[i] = mBtns[i].photoPath
                }
                connector.saveImages(photos);
                console.log("main: Save Btn information complete.")
            }
        }

        Button {
            id: reloadBtn
            width: 300
            height: 50
            text: "Reload"

            onClicked: {
                mPhotoPaths = connector.getImagePaths()
                for(var i=0; i<mSpacing; i++) {
                    mBtns[i].photoPath = mPhotoPaths[i]
                }
                console.log("main: Reload Btn information complete.")
            }
        }
    }
}
