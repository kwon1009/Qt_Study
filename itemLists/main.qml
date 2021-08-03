import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Window 2.12
import QtQml 2.1
import Connector 1.0
// import 오류 발생
// ASSERT failure in QList<T>::operator[]: "index out of range", file C:\Qt\5.12.11\mingw73_64\include/QtCore/qlist.h, line 552
// main.cpp에서 Connector의 위치를 위로 변경함으로써 해결됨
import "."

Window {
    property int mPhotoSize: 0      // property 정의 재확인 필요
    property string mPhotoPath: ""  // photoAni.qml -> photoBox

    Connector { id: connector }

    id: mainWindow
    width: 400
    height: 600
    visible: true
    title: qsTr("Item Lists")

    Component.onCompleted: {
        mPhotoSize = connector.getItemListSize();
        // 한번에 모두 받아올 수 있는 방법 알아보기
        for(var i=0; i<mPhotoSize; i++) {
            photoListView.model.append({"photoNo": i,
                                       "photoTitle": connector.getPhotoTitle(i),
                                       "photoPath": connector.getPhotoPath(i)
                                       })
        }
    }

    Component {
        id: photoComponent
        Item {
            property bool stateHover: false
            width: parent.width
            height: 100

            // 배치 설정하기 - 세로 가운데 정렬, List형식
            Image {
                id: photoImg
                anchors.left: parent.left
                anchors.margins: 10
                width: 50
                height: 50
                source: photoPath
            }

            MouseArea {
                id: photoArea
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    photoInfoAni.running = true
                }
                onExited: {
                    photoInfoAni.running = false
                }

                Text {
                    id: photoInfo
                    text: "No." + (photoNo+1) + " <" + photoTitle + ">"

                    NumberAnimation on x {
                        id: photoInfoAni
                        running: false
                        from: parent.x
                        to: parent.width - 100
                        duration: 1000
                        loops: Animation.Infinite
                    }
                }

            }

            Button {
                id: photoBtn
                width: 70
                height: 30
                anchors.right: parent.right
                anchors.margins: 10
                text: "More"
                onClicked: {
                    mPhotoPath = photoPath;
                    stackPhotoAni.push(Qt.resolvedUrl("qrc:/photoAni.qml"))
                }
            }

            Rectangle {
                width: parent.width
                anchors.bottom: parent.bottom
                height: 1
                color: "gray"
            }
        }
    }

    ListView {
        id: photoListView
        anchors.fill: parent
        model: ListModel{}
        delegate: photoComponent
        focus: true
    }

    // 추가 페이지가 열리는 방식
    // 현재 페이지에서 넘어가는 것은 아님
    StackView {
        id: stackPhotoAni
        anchors.fill: parent
        initialItem: Item {

        }
    }
}
