import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import "./components"
import "./src"

// firstView

Item {
    objectName: "firstView"

    signal sg_startAni();

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
                                // 화면 전환
                                firstView.visible = false
                                secondView.visible = true
                                sg_startAni();  // 애니메이션 시작
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
}
