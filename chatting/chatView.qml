import QtQuick 2.0
import QtQuick.Layouts 1.3
import Chat 1.0

Item {
    objectName: "chatView"
    property int titleBarHeight: 50

    property var mChatContents: [
//        {"id", ""
        // !!대화 내용 받아오도록 하기
    ]

    Chat { id: classChat }

    // signals
    signal getNextView(var nextView);

    // title bar
    TitleBar {
        property string titleName: "Chatting"
        property string prevBtnTxt: "<<"
        property string prevView: "chatListView.qml"
        property string rightBtnTxt: "More"
        property string rightBtnView: ""
    }

    // contents
    Rectangle {
        id: chatContents
        y: titleBarHeight
        width: parent.width
        height: parent.height - titleBarHeight

        Text {
            text: "test"
        }

        MouseArea {
            id: chatContentsArea
            anchors.fill: parent
            onClicked: {
                chatInputBox.height = 40
            }
        }
    }

    // text input
    Rectangle {
        id: chatInputBox
        anchors.bottom: parent.bottom
        width: parent.width
        height: 40
        color: "#EEEEEE"

        Rectangle {
            id: chatInputPlusBtn
            anchors.top: chatInputBox.top
            anchors.topMargin: 5
            anchors.left: chatInputBox.left
            anchors.leftMargin: 10
            width: 30
            height: 30
            radius: 10
            color: "#F5F5F5"
            border.color: "#BDBDBD"
            border.width: 1

            Text {
                text: "+"
                color: "#BDBDBD"
                font.bold: true
                font.pixelSize: 30
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id: chatInputTxtBox
            anchors.top: chatInputBox.top
            anchors.topMargin: 5
            anchors.left: chatInputPlusBtn.right
            anchors.leftMargin: 10
            width: 280
            height: 30
            radius: 10
            color: "white"
            border.color: "#BDBDBD"
            border.width: 2
        }

        Rectangle {
            id: chatInputSendBtn
            anchors.top: chatInputBox.top
            anchors.topMargin: 5
            anchors.right: chatInputBox.right
            anchors.rightMargin: 10
            width: 50
            height: 30
            radius: 10
            color: "#F5F5F5"
            border.color: "#BDBDBD"
            border.width: 1

            Text {
                text: "Send"
                font.pixelSize: 13
                anchors.centerIn: parent
            }
        }

        MouseArea {
            id: chatInputBoxArea
            anchors.fill: parent
            onClicked: {
                chatInputBox.height = 120
            }
        }
    }
}
