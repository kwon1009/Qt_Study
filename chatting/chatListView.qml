import QtQuick 2.0
import QtQuick.Layouts 1.2
import "."

Item {
    objectName: "chatListView"

    property int titleBarHeight: 50

    property var mChatList: [
        ["./src/Happy dog.jpg", "어니부기", "Hello. Qt Coading.", "2021.08.19"],
        ["./src/Happy dog.jpg", "어니부기", "Hello. Qt Coading.", "2021.08.19"],
        ["./src/Happy dog.jpg", "어니부기", "Hello. Qt Coading.", "2021.08.19"],
        ["./src/Happy dog.jpg", "어니부기", "Hello. Qt Coading.", "2021.08.19"],
        ["./src/Happy dog.jpg", "어니부기", "Hello. Qt Coading.", "2021.08.19"],
        ["./src/Happy dog.jpg", "어니부기", "Hello. Qt Coading.", "2021.08.19"],
        ["./src/Happy dog.jpg", "어니부기", "Hello. Qt Coading.", "2021.08.19"],
        ["./src/Happy dog.jpg", "어니부기", "Hello. Qt Coading.", "2021.08.19"]
    ]

    // signals
    signal getNextView(var nextView);

    // title bar
    TitleBar {
        property string titleName: "Chatting List"
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
