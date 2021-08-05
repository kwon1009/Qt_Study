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
    property variant mBoxs: [box0, box1, box2, box3, box4]  // 박스들. 고정값
    property variant mBtns: [btn0, btn1, btn2, btn3, btn4]  // 현재 위치별 버튼들
    property int mSpacing: 5

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
            console.log(nth)
            var tempBtn

            // 맨 앞인 경우, x < 0
            if(x < 0) {
                tempBtn = mBtns[nth]
                for(var i=nth-1; i>=0; i--) {
                    mBtns[i].position++
                    mBtns[i].x = mBoxs[i+1].x
                    mBtns[i+1] = mBtns[i]
                }
                mBtns[0] = tempBtn
                mBtns[0].position = 0
                mBtns[0].x = mBoxs[0].x
            }

            // !!마지막 영역이 인식되지 않음
            if(x >= mBoxs[mSpacing-1].x) {
                console.log("test x")
            }

            var prev
            var next    // 칸이 1개밖에 없을 때에 대한 예외 처리 필요
            for(prev=0; prev<mSpacing; prev++) {
                next = prev+1
                if(mBoxs[prev].x < x && x < mBoxs[next].x) {
                    console.log("prev", prev, mBoxs[prev].x, "/", x, "/", "next", next, mBoxs[next].x)
                    break
                }
            }

            // 왼쪽에서 오른쪽으로 오는 경우
            if(nth < prev) {
                // 오른쪽으로 한칸씩 이동
                for(var i=nth; i<prev; i++) {
                    console.log(nth, prev)
                    mBtns[i].position++
                    mBtns[i].x = mBoxs[i+1].x

                    mBtns[i+1].position--
                    mBtns[i+1].x = mBoxs[i].x

                    tempBtn = mBtns[i+1]
                    mBtns[i+1] = mBtns[i]
                    mBtns[i] = tempBtn
                }
            }
            // 자리가 변하지 않은 경우
            else if (nth == prev) {
                mBtns[nth].x = mBoxs[nth].x
            }
            // 오른쪽에서 왼쪽으로 오는 경우
            else {
                // 왼쪽으로 한칸씩 이동
                for(var i=nth; i>prev; i--) {
                    mBtns[i].position--
                    mBtns[i].x = mBoxs[i-1].x

                    mBtns[i-1].position++
                    mBtns[i-1].x = mBoxs[i].x

                    tempBtn = mBtns[i]
                    mBtns[i] = mBtns[i-1]
                    mBtns[i-1] = tempBtn
                }
            }

            // !!모두 재정렬

            // 포지션에 맞는 위치 설정
            // !!한번에 수행할 수 있도록 하기
        }
    }

    RowLayout {
        id: btns
        anchors.fill: parent
        spacing: mSpacing

        Rectangle {
            id: box0
            property int boxNo: 0
            Layout.preferredWidth: parent.width/mSpacing
            Layout.fillHeight: true
            color: "red"
        }

        Rectangle {
            id: box1
            property int boxNo: 1
            Layout.preferredWidth: parent.width/mSpacing
            Layout.fillHeight: true
            color: "yellow"
        }

        Rectangle {
            id: box2
            property int boxNo: 2
            Layout.preferredWidth: parent.width/mSpacing
            Layout.fillHeight: true
            color: "green"
        }

        Rectangle {
            id: box3
            property int boxNo: 3
            Layout.preferredWidth: parent.width/mSpacing
            Layout.fillHeight: true
            color: "blue"
        }

        Rectangle {
            id: box4
            property int boxNo: 4
            Layout.preferredWidth: parent.width/mSpacing
            Layout.fillHeight: true
            color: "white"
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

    MyButton {
        id: btn3
        position: 3
        photoPath: mPhotoPaths[3]
        x: box3.x
    }

    MyButton {
        id: btn4
        position: 4
        photoPath: mPhotoPaths[4]
        x: box4.x
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
