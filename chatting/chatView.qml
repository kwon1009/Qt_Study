import QtQuick 2.0

Item {
    objectName: "chatView"
    property int titleBarHeight: 50

    // signals
    signal getNextView(var nextView);

    // title bar
    TitleBar {
        property string titleName: "Chatting"
        property string prevView: "chatListView.qml"
        property string rightBtnTxt: "Set"
        property string rightBtnView: ""
    }

//    Rectangle {
//        anchors.fill: parent
//        y: 50
//        width: parent.width
//        Text {
//            text: "test"
//        }
//    }
}
