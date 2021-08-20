import QtQuick 2.0
import QtQuick.Layouts 1.2
import ChatList 1.0
import "."

Item {
    objectName: "chatListView"

    property int titleBarHeight: 50

    property var mChatList: []

    ChatList {
        id: classChatList
    }  // 새로 만들어지는 class. 해당 페이지에 직접 속하게 된다.
    // !!데이터 전달에 대해 확인 필요
    // !!현재 페이지와 ChatView와 연동여부 확인 필요
    // !!설정과 같은 전반적인 데이터 연동 구조 확인 필요


    // signals
    signal getNextView(var nextView);
    signal sg_getChatList();

    // slots
    function slot_test() {
        console.log("test")
    }

    // title bar
    TitleBar {
        property string titleName: "Chatting List"
        property string prevBtnTxt: "Lout"
        property string prevView: "loginView.qml"
        property string rightBtnTxt: "Set"
        property string rightBtnView: ""
    }

    // contents
    Rectangle {
        id: chatList
        y: titleBarHeight
        width: parent.width
        height: parent.height - titleBarHeight

        Component.onCompleted: {

            // setting chat list
            var chats = classChatList.getChatList()
            for(var i=0; i<chats.length; i++) {
                mChatList[i] = chats[i]
                console.log(mChatList[i], chats[i])
            }

            // setting chat list component
            console.log("chatListView.qml: mChatList size is", mChatList.length)
            for(var i=0; i<mChatList.length; i++) {
                chatListView.model.append({
                                             "chatProfileImg": mChatList[i][0],
                                             "chatProfileName": mChatList[i][1],
                                             "chatLastContents": mChatList[i][2],
                                             "chatLastTime": mChatList[i][3]
                                         })
            }
            console.log("chatListview.qml: load chat list completed.")
        }

        // component
        Component {
            id:chatComponent

            Rectangle {
                width: parent.width
                height: 80
                border.width: 1
                border.color: "gray"
                color: "transparent"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("chatListView.qml: click list", mChatList[1])
                        console.log("chatListView.qml: click list. nextView is chatView.qml")
                        getNextView("chatView.qml")
                    }
                }

                RowLayout {
                    anchors.fill: parent
                    spacing: 3

                    // profile image
                    Rectangle {
                        Layout.fillHeight: true
                        Layout.preferredWidth: 80
                        color: "transparent"

                        Rectangle {
                            width: 60
                            height: 60
                            radius: 10
                            anchors.centerIn: parent
                            color: "green"

                            Image {
                                anchors.fill: parent
                                fillMode: Image.PreserveAspectCrop
                                source: chatProfileImg
                            }
                        }
                    }

                    // chat data
                    Rectangle {
                        Layout.fillHeight: true
                        Layout.preferredWidth: parent.width - 180
                        color: "transparent"

                        ColumnLayout {
                            anchors.fill: parent
                            spacing: 2

                            Rectangle {
                                id: chatId
                                Layout.fillWidth: parent.width
                                Layout.preferredHeight: 20
                                color: "transparent"

                                Text {
                                    y: 10
                                    text: chatProfileName
                                    font.bold: true
                                }
                            }

                            Rectangle {
                                Layout.fillWidth: parent.width
                                Layout.preferredHeight: 40
                                color: "transparent"

                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: chatLastContents
                                }
                            }
                        }
                    }

                    // chat time
                    Rectangle {
                        Layout.fillHeight: true
                        Layout.preferredWidth: 100
                        color: "transparent"

                        Text {
                            anchors.centerIn: parent
                            color: "gray"
                            text: chatLastTime
                        }
                    }
                }
            }
        }

        ListView {
            id: chatListView
            anchors.fill: parent
            delegate: chatComponent
            model: ListModel{}
        }
    }
}
