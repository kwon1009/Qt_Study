import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import "."

Window {
    // !!공통 소스 폴더를 만들기
    // !!자동으로 사진 받아오도록 함
    property variant mPhotoPaths: [
        "./src/Kittens.jpg",
        "./src/So cute.jpg",
        "./src/HamZzi.jpg",
        "./src/What.jpg",
        "./src/Thinking.jpg"]
    property int mSpacing: 5
    property variant mBoxs: []  // 박스들. 고정값 !!꼭 박스 영역이 아닌, 단순 x좌표로 저장하여 적용하기
                                // !!영역 설정 자체가 필요 없도록 수정
    property variant mBtns: []  // 현재 위치별 버튼들

    id: mainWindow
    width: 900
    height: 400
    visible: true

    // 버튼 정렬 함수
    // !!'저장하기' 기능을 적용할 수 있도록 component 접근 방법, 또는 다른 방법을 찾아보기
    // !! position 속성으로 적용 가능한지 확인하기
    function sortingBtn(target) {
        var x = target.x
        var nth = target.position  // 원래 위치 저장
        var prev    // 실제 변경할 위치
        var next    // 실제 변경할 위치의 오른쪽 영역
        var tempBtn // 버튼 정보 임시 저장 변수

        // 맨 앞인 경우, x < 0
        if(x < 0) { x = 0 }

        // !!마지막 영역이 인식되지 않음
        if(x >= mBoxs[mSpacing-1].x) {
           console.log("test x")
        }

        // x 포인트 위치 확인
        for(prev=0; prev<mSpacing; prev++) {
            next = prev+1
            if(mBoxs[prev].x <= x && x < mBoxs[next].x) {
                break
            }
        }

        tempBtn = mBtns[nth]
        if(nth < prev) {
            // 왼쪽에서 오른쪽으로 오는 경우
            for(var i=nth+1; i<=prev; i++) {
                mBtns[i].position--
                mBtns[i].x = mBoxs[i-1].x
                mBtns[i-1] = mBtns[i]
            }
        }
        else if (nth > prev) {
            // 오른쪽에서 왼쪽으로 오는 경우
            for(var i=nth-1; i>=prev; i--) {
                mBtns[i].position++
                mBtns[i].x = mBoxs[i+1].x
                mBtns[i+1] = mBtns[i]
            }
        }
        mBtns[prev] = tempBtn
        mBtns[prev].position = prev
        mBtns[prev].x = mBoxs[prev].x
        mBtns[prev].y = mBoxs[prev].height/2 - mBtns[prev].height/2
    }

    DropArea {
        anchors.fill: parent    // !!전체 영역으로 설정하였으나, 반만 적용됨
        onExited: {
            // 마우스 클릭 해제 시 이벤트 적용
            sortingBtn(drag.source)
        }
    }

    Item {
        anchors.fill: parent
        Component.onCompleted: {
            for(var i=0; i<mSpacing; i++) {
                console.log("component", mBoxs[i])
                var component = Qt.createComponent("MyButton.qml")
                component.createObject(parent, {
                                     position: i,
                                     photoPath: mPhotoPaths[i],
                                     x: mBoxs[i].x,
                                     y: mBoxs[i].height/2 - height/2
                                 });
                mBtns.push(component)
            }
        }

        Component {
            id: myBtnComponent
            MyButton { id: btn }
        }
        Loader { sourceComponent: myBtnComponent }
    }

    RowLayout {
        id: btns
        anchors.fill: parent
        spacing: mSpacing

        Component.onCompleted: {
            for(var i=0; i<mSpacing; i++) {
                var component = Qt.createComponent("BaseBox.qml")
                component.createObject(btns, {});
                mBoxs.push(component)
            }
        }

        Component {
            id: boxComponent
            BaseBox { id: btn }
        }
        Loader { sourceComponent: boxComponent }
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
