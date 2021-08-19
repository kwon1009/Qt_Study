import QtQuick 2.0

Item {
    objectName: "chatListView"
    property var nextView: "chatListView.qml"

    Rectangle {
        id: chatList
        Text {
            text: "chatListView.qml"
        }
    }
}
