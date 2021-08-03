import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Window 2.12
import QtQml 2.1
import Connector 1.0
// import 오류 발생
// ASSERT failure in QList<T>::operator[]: "index out of range", file C:\Qt\5.12.11\mingw73_64\include/QtCore/qlist.h, line 552
// main.cpp에서 Connector의 위치를 위로 변경함으로써 해결됨
import "."

Window {
    property int mPhotoSize: 0  // property 정의 재확인 필요

    width: 400
    height: 600
    visible: true
    title: qsTr("Item Lists")

    Connector {
        id: connector
    }

    Component.onCompleted: {
        mPhotoSize = connector.getItemListSize();
        // 한번에 모두 받아올 수 있는 방법 알아보기
        for(var i=0; i<mPhotoSize; i++) {
            photoListView.model.append({"photoNo": i,
                                       "photoTitle": connector.getPhotoTitle(i),
                                       "photoPath": connector.getPhotoPath(i)
                                       })
        }
    }

    Component {
        id: photoComponent
        Item {
            width: parent.width
            height: 100

            // 배치 설정하기 - 세로 가운데 정렬, List형식
            Image {
                id: photoImg
                anchors.left: parent.left
                anchors.margins: 10
                width: 50
                height: 50
                source: photoPath
            }

            Text {
                id: photoText
                anchors.left: parent.left
                anchors.leftMargin: 70
                text: "No." + photoNo + " <" + photoTitle + ">"
            }

            Button {
                id: photoBtn
                width: 70
                height: 30
                anchors.right: parent.right
                anchors.margins: 10
                text: "More"
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
}
