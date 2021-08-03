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

//    Component.onCompleted: {
//        mPhotoSize = connector.getItemListSize();
//        // !!한번에 모두 받아올 수 있는 방법 알아보기
//        for(var i=0; i<mPhotoSize; i++) {
//            photoListView.model.append({"photoNo": i,
//                                       "photoTitle": connector.getPhotoTitle(i),
//                                       "photoPath": connector.getPhotoPath(i)
//                                       })
//        }
//    }

    Rectangle {
        width: 100; height: 100
        color: "green"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                if(containsMouse) {
                    parent.color = "yellow"
                }
            }

            onExited: {
                if(!containsMouse) {
                    parent.color = "green"
                }
            }
        }
    }

//    Component {
//        id: photoComponent
//        Rectangle {
//            property int mMargin: 10

//            width: parent.width
//            height: 100

//            RowLayout {
//                anchors.fill: parent
//                spacing: 3

//                Rectangle {
//                    Layout.fillHeight: true
//                    Layout.preferredWidth: 100

//                    Image {
//                        id: photoImg
//                        fillMode: Image.PreserveAspectCrop
//                        anchors.centerIn: parent
//                        anchors.fill: parent
//                        source: photoPath
//                    }
//                }

//                Rectangle {
//                    Layout.fillHeight: true
//                    Layout.preferredWidth: parent.width - 200

//                    Text {
//                        id: photoInfo
//                        anchors.verticalCenter: parent.verticalCenter
//                        text: "No." + (photoNo+1) + " <" + photoTitle + ">"

//                        NumberAnimation on x {
//                            id: photoInfoAni
//                            running: false
//                            from: parent.x
//                            to: parent.x+parent.width
//                            duration: 1000
//                            loops: Animation.Infinite
//                        }
//                    }

//                    MouseArea {
//                        id: photoArea
//                        anchors.fill: parent

//                        // hover 시, text animation 적용
//                        // !!hover가 정상적으로 적용되지 않고 있음
//                        hoverEnabled: true
//                        onEntered: {
//                            if(containsMouse) {
//                                console.log("enter")
//                                photoInfoAni.running = true
//                            }
//                        }
//                        onExited: {
//                            if(!containsMouse) {
//                                console.log("exit")
//                                photoInfoAni.running = false
//                                photoInfo.x = parent.x
//                            }
//                        }
//                    }
//                }

//                Rectangle {
//                    Layout.fillHeight: true
//                    Layout.preferredWidth: 100

//                    Button {
//                        id: photoBtn
//                        width: 70
//                        height: 30
//                        anchors.centerIn: parent
//                        text: "More"
//                        onClicked: {
//                            mPhotoPath = photoPath;
//                            stackPhotoAni.push(Qt.resolvedUrl("qrc:/photoAni.qml"))
//                        }
//                    }
//                }
//            }

//            Rectangle {
//                width: parent.width
//                height: 1
//                color: "gray"
//            }



//        }
//    }

//    ListView {
//        id: photoListView
//        anchors.fill: parent
//        model: ListModel{}
//        delegate: photoComponent
//        focus: true
//    }

//    // !!Stack 외에 다른 방식이 있는지 확인해보기
//    StackView {
//        id: stackPhotoAni
//        anchors.fill: parent
//        initialItem: Item {

//        }
//    }
}
