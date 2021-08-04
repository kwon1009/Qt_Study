import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "."

Window {
    property variant mPhotoPaths: [
        "./src/Kittens.jpg",
        "./src/So cute.jpg",
        "./src/HamZzi.jpg"]
    property variant xPs: [0, 210, 420]

    property int tempCount: 0       // test용 숫자

    id: mainWindow
    width: 1000
    height: 400
    visible: true

    // 마우스 클릭 해제 시 이벤트 적용
    DropArea {
        anchors.fill: parent
        onExited: {
            console.log("exit", tempCount, drag.x, drag.y, drag.source.btnNo)
            tempCount++
            var targetNo = drag.source.btnNo
            // !!순서 설정하기
        }

//        onDropped: {
//            console.log("drop", drag.x, drag.y)
//        }
    }

    // !!동적으로 배정되도록 하기
    MyButton {
        id: btn0
        btnNo: 0
        photoPath: mPhotoPaths[0]
        x: xPs[0]
    }

    MyButton {
        id: btn1
        btnNo: 1
        photoPath: mPhotoPaths[1]
        x: xPs[1]
    }

    MyButton {
        id: btn2
        btnNo: 2
        photoPath: mPhotoPaths[2]
        x: xPs[2]
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
