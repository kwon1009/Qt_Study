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
        "./src/HamZzi.jpg",
        "./src/What.jpg",
        "./src/Thinking.jpg"
    ]

    property int mDragBtn: 0
    property var mXs: []        // 좌표 모음
    property variant mBoxs: [box0, box1, box2, box3, box4]  // 박스들. 고정값
    property variant mBtns: [btn0, btn1, btn2, btn3, btn4]  // 현재 위치별 버튼들
    property int mSpacing: 5


    id: mainWindow
    width: 1000
    height: 400
    visible: true

    Component.onCompleted: {
        var w = mainWindow.width/mSpacing
        for(var i=0; i<mSpacing; i++) {
            mXs[i] = w*i
        }
    }

    // 마우스 클릭 해제 시 이벤트 적용
    DropArea {
        anchors.fill: parent
        onExited: {
            var x = drag.source.x
            var nth = drag.source.position  // 원래 위치 저장
            var prev    // 실제 변경할 위치
            var next    // 실제 변경할 위치의 오른쪽 영역
            var tempBtn // 버튼 정보 임시 저장 변수

            console.log("x", x)

            // 맨 앞인 경우, x < 0
            if(x < 0) { x = 0 }

            // !!마지막 영역이 인식되지 않음
//            if(x >= mBoxs[mSpacing-1].x) {
//                console.log("test x")
//            }

            // x 포인트 위치 확인
            for(prev=0; prev<mSpacing; prev++) {
                next = prev+1
                if(mXs[prev] <= x && x < mXs[next]) {
                    break
                }
            }

            tempBtn = mBtns[nth]
            if(nth < prev) {
                // 왼쪽에서 오른쪽으로 오는 경우
                for(var i=nth+1; i<=prev; i++) {
                    mBtns[i].position--
                    mBtns[i].x = mXs[i-1]
                    mBtns[i-1] = mBtns[i]
                }
            }
            else if (nth > prev) {
                // 오른쪽에서 왼쪽으로 오는 경우
                for(var i=nth-1; i>=prev; i--) {
                    mBtns[i].position++
                    mBtns[i].x = mXs[i+1]
                    mBtns[i+1] = mBtns[i]
                }
            }
            mBtns[prev] = tempBtn
            mBtns[prev].position = prev
            mBtns[prev].x = mXs[prev]
            mBtns[prev].y = parent.height/2 - mBtns[prev].height/2
        }
    }

    // !!동적으로 배정되도록 하기
    MyButton {
        id: btn0
        position: 0
        photoPath: mPhotoPaths[0]
        x: parent.width/mSpacing * 0
        y: parent.height/2 - height/2
    }

    // !!동적으로 배정되도록 하기
    MyButton {
        id: btn1
        position: 1
        photoPath: mPhotoPaths[1]
        x: parent.width/mSpacing * 1
        y: parent.height/2 - height/2
    }

    MyButton {
        id: btn2
        position: 2
        photoPath: mPhotoPaths[2]
        x: parent.width/mSpacing * 2
        y: parent.height/2 - height/2
    }

    MyButton {
        id: btn3
        position: 3
        photoPath: mPhotoPaths[3]
        x: parent.width/mSpacing * 3
        y: parent.height/2 - height/2
    }

    MyButton {
        id: btn4
        position: 4
        photoPath: mPhotoPaths[4]
        x: parent.width/mSpacing * 4
        y: parent.height/2 - height/2
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
