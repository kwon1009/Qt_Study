import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import "."

Window {
    // !!공통 소스 폴더를 만들기
    property variant mPhotoPaths: [
        "./src/Kittens.jpg",
        "./src/So cute.jpg",
        "./src/HamZzi.jpg"]

    property int mDragBtn: 0
    property variant mBoxs: [box0, box1, box2]  // 박스들. 고정값
    property variant mBtns: [btn0, btn1, btn2]  // 현재 위치별 버튼들

    property int dropBox: 0
    property int boxWidth: 300
    property int tempCount: 0       // test용 숫자

    id: mainWindow
    width: 900
    height: 400
    visible: true

    // 마우스 클릭 해제 시 이벤트 적용
    DropArea {
        anchors.fill: parent
        onExited: {
            var x = drag.source.x
            var nth = drag.source.position  // 원래 순서 저장

            console.log("x", x, "boxs", mBoxs[nth].x)
            // 맨 앞으로 이동한 경우
            if(x < mBoxs[1].x) {
                var tempBtn = mBtns[nth]
                if(nth != 0) {
                    for(var i=nth-1; i>=0; i--) {
                        mBtns[i].position++
                        mBtns[i].x = mBoxs[i+1].x
                        mBtns[i+1] = mBtns[i]
                    }
                }
                mBtns[0] = tempBtn
                mBtns[0].position = 0
                mBtns[0].x = mBoxs[0].x
            }
            // 맨 뒤로 이동한 경우
            // !!인식하지 못함
            else if(x >= mBoxs[2].x) {
                console.log("last")
            }
            // 중간으로 이동한 경우
            else {
                console.log("mid")
            }

            // 포지션에 맞는 위치 설정
            // !!한번에 수행할 수 있도록 하기
        }
    }

    RowLayout {
        id: btns
        anchors.fill: parent
        spacing: 3

        Rectangle {
            id: box0
            property int boxNo: 0
            Layout.preferredWidth: parent.width/3
            Layout.fillHeight: true
            color: "red"
        }

        Rectangle {
            id: box1
            property int boxNo: 1
            Layout.preferredWidth: parent.width/3
            Layout.fillHeight: true
            color: "yellow"
        }

        Rectangle {
            id: box2
            property int boxNo: 2
            Layout.preferredWidth: parent.width/3
            Layout.fillHeight: true
            color: "green"
        }
    }


    // !!동적으로 배정되도록 하기
    MyButton {
        id: btn0
        position: 0
        photoPath: mPhotoPaths[0]
        x: box0.x
    }

    // !!동적으로 배정되도록 하기
    MyButton {
        id: btn1
        position: 1
        photoPath: mPhotoPaths[1]
        x: box1.x
    }

    MyButton {
        id: btn2
        position: 2
        photoPath: mPhotoPaths[2]
        x: box2.x
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
