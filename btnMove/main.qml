import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "."

Window {
    property variant mPhotoPaths: [
        "./src/Kittens.jpg",
        "./src/So cute.jpg",
        "./src/HamZzi.jpg"]

    width: 1000
    height: 400
    visible: true


    Component.onCompleted: {
        for(var i=0; i<3; i++) {
            btnListView.model.append({"btnNo": i,
                                       "mPhotoPath": mPhotoPaths[i]
                                       })
        }
    }

    Component {
        id: btnComponent

        Rectangle {
            id: btn
            property int btnNo: 0

            width: 200
            height: 200
            color: "gray"

            Drag.active: dragArea.drag.active   // 드래그 적용
            Drag.hotSpot.x: parent.width/2      // 마우스 포인터 위치 고정
            Drag.hotSpot.y: parent.height/2

            states: State {
                when: dragArea.drag.active
                PropertyChanges {
                    target: btn
                    color: "yellow"
                }
            }

            Image {
                fillMode: Image.PreserveAspectCrop
                source: mPhotoPath      // 자동으로 받아오는 값
                width: 100
                height: 100
                // !!이미지가 붙어 있도록 해야 함
                // !!parent로 할 시, 이미지가 분리됨
            }

            MouseArea {
                id: dragArea
                anchors.fill: parent
                drag.target: btn

                // 마우스 클릭 해제 시 이벤트 적용
                onReleased: {
                    console.log("release", parent.mouseX, parent.mouseY)
//                    drag.target.x = 0
//                    drag.target.y = 0
                }
            }
        }

    }

    ListView {
        id: btnListView
        anchors.fill: parent
        model: ListModel{}
        delegate: btnComponent
    }
}
