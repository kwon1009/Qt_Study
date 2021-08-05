import QtQuick 2.0
import QtQuick.Controls 2.12
import "."

Rectangle {
    property int position: 0
    property string photoPath: ""

    width: 150
    height: 150
    color: "gray"

    Drag.active: btnMouseArea.drag.active
    Drag.hotSpot.x: parent.width/2
    Drag.hotSpot.y: parent.height/2

    Image {
        fillMode: Image.PreserveAspectCrop
        source: photoPath
        width: 100
        height: 100
        // !!이미지가 붙어 있도록 해야 함
        // !!parent로 할 시, 이미지가 분리됨
    }

    MouseArea {
        id: btnMouseArea
        anchors.fill: parent
        drag.target: parent

        // !!drag가 유지되지 않음
        onEntered: {
            parent.color = "yellow"
        }

        onExited: {
            parent.color = "gray"
            var x = parent.x
            var nth = parent.position  // 원래 위치 저장
            var prev    // 실제 변경할 위치
            var next    // 실제 변경할 위치의 오른쪽 영역
            var tempBtn // 버튼 정보 임시 저장 변수

            console.log("x", x)

            // 맨 앞인 경우
            if(x < 0) { x = 0 }

            // 마지막인 경우, x >= mXs[mSpacing-1]
            if(x >= mXs[mSpacing-1]) {
                prev = mSpacing-1
            } else {
                // x 포인트 위치 확인
                for(prev=0; prev<mSpacing; prev++) {
                    next = prev+1
                    if(mXs[prev] <= x && x < mXs[next]) {
                        break
                    }
                }
            }

            tempBtn = mBtns[nth]
            if(nth < prev) {
                // 왼쪽에서 오른쪽으로 오는 경우
                for(var i=nth+1; i<=prev; i++) {
                    console.log(i)
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
            mBtns[prev].y = parent.height/2 - parent.height/2
        }
    }
}
