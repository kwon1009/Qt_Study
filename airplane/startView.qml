import QtQuick 2.0

Item {
    property var btnColor: "Khaki"
    property var btnHoverColor: "Coral"

    anchors.fill: parent

    Rectangle {
        id: startBtn

        anchors.centerIn: parent
        width: 60
        height: 30
        radius: 20
        color: btnColor

        Text {
            anchors.centerIn: parent
            text: "Start"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                startBtn.color = btnHoverColor
            }

            onExited: {
                startBtn.color = btnColor
            }

            onClicked: {
                console.log("startView.qml: startbtn click")
                sg_startBtnClick();
            }
        }
    }
}
