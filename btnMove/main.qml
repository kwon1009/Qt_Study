import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "."

Window {
    // !!공통 소스 폴더를 만들기
    property variant mPhotoPaths: [
        "./src/Kittens.jpg",
        "./src/So cute.jpg",
        "./src/HamZzi.jpg"]
    property variant mXs: [0, 210, 420]

    property int tempCount: 0       // test용 숫자

    id: mainWindow
    width: 1000
    height: 400
    visible: true

    // 마우스 클릭 해제 시 이벤트 적용
    DropArea {
        anchors.fill: btns
        onExited: {
            console.log("exit", tempCount, drag.x, drag.y, drag.source.btnNo)
            tempCount++
            var targetNo = drag.source.btnNo    // !!아이디를 직접 가져오는 방법

            drag.source.x = mXs[1]
            // !!순서 설정하기
            if(targetNo == 0) {
                if(mXs[1] > drag.x) {
                    drag.source.x = mXs[1]
                }
            } else if (targetNo == mPhotoPaths.length) {

            }
        }
    }

    Item {
        id: btns
        anchors.fill: parent    // !!아이템 가운데정렬 하도록 하기

        // !!동적으로 배정되도록 하기
        MyButton {
            id: btn0
            btnNo: 0
            photoPath: mPhotoPaths[0]
            x: mXs[0]
        }

        MyButton {
            id: btn1
            btnNo: 1
            photoPath: mPhotoPaths[1]
            x: mXs[1]
        }

        MyButton {
            id: btn2
            btnNo: 2
            photoPath: mPhotoPaths[2]
            x: mXs[2]
        }
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
