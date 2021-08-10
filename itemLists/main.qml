import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Window 2.12
import QtQml 2.1
import QtQuick.Layouts 1.3

import Connector 1.0
import "./components"
import "./src"

Window {
    property int mPhotoSize: 0
    property string mPhotoPath: ""  // photoAni.qml -> photoBox

    Connector { id: connector }

    // signal
    signal sg_infiReverse();

    // slots
    function slog_checkTime() {
        // 5초마다 cpp에서 신호를 주면, 회전을 변환함
        console.log("Get check time Signal.")
    }

    property bool btnOneTimeClick: false
    property int time: 0
    function slot_timer() {
        time++
        console.log("main-timer:", time)
    }

    id: mainWindow
    width: 400
    height: 600
    visible: true
    title: qsTr("Item Lists")

    Component.onCompleted: {
        mPhotoSize = connector.getItemListSize();
        // !!한번에 모두 받아올 수 있는 방법 알아보기
        for(var i=0; i<mPhotoSize; i++) {
            photoListView.model.append({"photoNo": i,
                                       "photoTitle": connector.getPhotoTitle(i),
                                       "photoPath": connector.getPhotoPath(i)
                                       })
        }
    }

    Component {
        id: photoComponent
        Rectangle {
            id: photoListBox
            property int mMargin: 10

            width: parent.width
            height: 100

            RowLayout {
                anchors.fill: parent
                spacing: 3

                Rectangle {
                    Layout.fillHeight: true
                    Layout.preferredWidth: 100
                    color: "transparent"

                    Image {
                        id: photoImg
                        fillMode: Image.PreserveAspectCrop
                        anchors.centerIn: parent
                        anchors.fill: parent
                        source: photoPath
                    }
                }

                Rectangle {
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width - 200
                    Layout.leftMargin: mMargin
                    color: "transparent"

                    Text {
                        id: photoInfo
                        anchors.verticalCenter: parent.verticalCenter
                        text: "No." + (photoNo+1) + " <" + photoTitle + ">"

                        NumberAnimation on x {
                            id: photoInfoAni
                            running: false
                            from: parent.x
                            to: parent.x + photoInfo.width
                            duration: 1000
                            loops: Animation.Infinite
                        }
                    }
                }

                Rectangle {
                    Layout.fillHeight: true
                    Layout.preferredWidth: 100
                    color: "transparent"

                    ListButton {
                        id: photoBtn
                        text: "More"

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                mPhotoPath = photoPath;
                                stackPhotoAni.push(Qt.resolvedUrl("qrc:/photoAni.qml"))
                            }
                        }
                    }
                }
            }

            Border {}

            MouseArea {
                anchors.fill: parent
                z: -1   // photoBtn이 z-layer 위로 보내지도록 하기 위함
                hoverEnabled: true
                onEntered: {
                    photoInfoAni.running = true
                    photoListBox.color = "lightyellow"
                }
                onExited: {
                    var check = !(mouseX > 300 && mouseY > 30 && mouseY < 70)
                    if(check) {
                        photoInfoAni.running = false
                        photoListBox.color = "white"
                        photoInfo.x = photoInfoAni.from
                    }
                }
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

    // !!Stack 외에 다른 방식이 있는지 확인해보기
    StackView {
        id: stackPhotoAni
        anchors.fill: parent
        initialItem: photoListView
    }
}
