import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

import Connector 1.0
import "."

Window {
    property int mSpacing: 6        // 배치할 버튼 수
    property var mPhotoPaths: []    // 이미지 모음. 동적할당
    property var mXs: []            // 좌표 모음. 동적 할당
    property var mBtns: []          // 현재 위치별 버튼들
    property var log: ""            // 진행 상태 조회

    id: mainWindow
    width: 1000
    height: 400
    visible: true

    Connector { id: connector }

    // slot
    function slot_showError(err) {
        logText.text = err
        logText.color = "red"
    }

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

    ColumnLayout {
        anchors.fill: parent
        anchors.bottomMargin: 10
        spacing: 3

        Rectangle {
            id: btnArea
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.height - 70
            Component.onCompleted: {
                var btnSize = 150
                for(var i=0; i<mSpacing; i++) {
                    var component = Qt.createComponent("MyButton.qml")
                    var btn = component.createObject(parent, {
                                               position: i,
                                               mBtnSize: btnSize,
                                               photoPath: mPhotoPaths[i],
                                               x: parent.width/mSpacing * i,
                                               y: btnArea.height/2 - btnSize/2
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

        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 10
            Text {
                id: logText
                anchors.centerIn: parent
                text: log
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 60

            Button {
                id: saveBtn
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: 300
                Layout.preferredHeight: 50
                text: "Save"

                onClicked: {
                    var photos = []
                    for(var i=0; i<mSpacing; i++) {
                        photos[i] = mBtns[i].photoPath
                    }
                    connector.saveImages(photos);
                    logText.color = "blue"
                    logText.text = "Save Complete."
                    console.log("main: Save Btn information complete.")
                }
            }

            Button {
                id: reloadBtn
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: 300
                Layout.preferredHeight: 50
                text: "Reload"

                onClicked: {
                    mPhotoPaths = connector.getImagePaths()
                    for(var i=0; i<mSpacing; i++) {
                        mBtns[i].photoPath = mPhotoPaths[i]
                    }
                    logText.color = "blue"
                    logText.text = "Reload Complete."
                    console.log("main: Reload Btn information complete.")
                }
            }
        }
    }
}
