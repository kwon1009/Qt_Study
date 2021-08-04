import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Window 2.12
import QtQml 2.1
import QtQuick.Layouts 1.3

import Connector 1.0
import "."

Window {
    property int mPhotoSize: 0
    property string mPhotoPath: ""  // photoAni.qml -> photoBox

    Connector { id: connector }

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

            MouseArea {
                anchors.fill: photoListBox
                hoverEnabled: true
                onEntered: {
                    photoInfoAni.running = true
                    photoListBox.color = "lightyellow"
                }
                onExited: {
                    photoInfoAni.running = false
                    photoInfo.x = photoInfoAni.from
                    photoListBox.color = "white"
                }
            }

            RowLayout {
                anchors.fill: parent
                spacing: 3

                Rectangle {
                    id: fstRow
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
                    id: scdRow
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
                    id: thdRow
                    Layout.fillHeight: true
                    Layout.preferredWidth: 100
                    color: "transparent"

                    Rectangle {
                        id: photoBtn
                        width: 70
                        height: 30
                        radius: 40
                        color: "#82B1FF"
                        anchors.centerIn: thdRow

                        Text { id: photoBtnText; text: "More"; anchors.centerIn: parent }

                        MouseArea {
                            anchors.fill: photoBtn
                            hoverEnabled: true
                            onEntered: {
                                photoBtn.color = "#FF5252"
                                photoBtnText.font.bold = true
                            }
                            onExited: {
                                photoBtn.color = "#82B1FF"
                            }

                            onClicked: {
                                mPhotoPath = photoPath;
                                stackPhotoAni.push(Qt.resolvedUrl("qrc:/photoAni.qml"))
                            }
                        }
                    }
                }
            }

            // component border
            Rectangle {
                width: parent.width
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

    // !!Stack 외에 다른 방식이 있는지 확인해보기
    StackView {
        id: stackPhotoAni
        anchors.fill: parent
        initialItem: photoListView
    }
}
