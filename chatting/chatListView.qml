import QtQuick 2.0

Item {
    objectName: "chatListView"
    property var nextView: "loginView.qml"

    // signals
    signal getNextView(var nextView);

    Rectangle {
        id: title
        width: parent.width
        height: 50
        color: "#FFF9C4"
    }

    Rectangle {
        id: chatList
        anchors.top: title.bottom
        width: parent.width
        height: 50

        Text {
            text: "chatListView.qml"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("LoginView.qml: click loginBtn. nextView is", nextView)
                getNextView(nextView);
            }
        }
    }
}
