import QtQuick 2.0
import QtQuick.Window 2.2

Item {
    objectName: "loginView"
    property var nextView: "chatListView.qml"

    // signals
    signal getNextView(var nextView);

    Rectangle {
        property var btnColor: "#90CAF9"
        property var btnHoverColor: "#1E88E5"

        id: loginBtn
        width: 100
        height: 50
        anchors.centerIn: parent
        color: mouseArea.containsMouse? btnHoverColor : btnColor
        radius: 10

        Text {
            text: "Login"
            anchors.centerIn: parent
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true

            onClicked: {
                console.log("LoginView.qml: click loginBtn. nextView is", nextView)
                getNextView(nextView);
            }
        }
    }
}
