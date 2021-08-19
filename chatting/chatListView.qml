import QtQuick 2.0
import QtQuick.Layouts 1.2
import "."

Item {
    objectName: "chatListView"
    property int titleBarHeight: 50
    property string titleName: "Chatting List"

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
    Rectangle {
        id: titleBar

        width: parent.width
        height: titleBarHeight
        color: "#FFF9C4"


        RowLayout {
            spacing: 3
            anchors.fill: parent

            Rectangle {
                Layout.preferredWidth: parent.width/4
                Layout.fillHeight: true
                color: "transparent"

                Rectangle {
                    id: prevBtn
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    width: 40; height: 40
                    color: prevBtnArea.containsMouse? "#FFFDE7" : "white"
                    radius: 20

                    Text {
                        anchors.centerIn: parent
                        text: "<<"
                    }

                    MouseArea {
                        id: prevBtnArea
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            console.log("chatListView.qml: click prevBtn. nextView is loginView.qml")
                            getNextView("loginView.qml");
                        }
                    }
                }
            }

            Rectangle {
                Layout.preferredWidth: parent.width/2
                Layout.fillHeight: true
                color: "transparent"
                Text {
                    anchors.centerIn: parent
                    text: titleName
                    font.bold: true
                }
            }

            Rectangle {
                property var nextView: "loginView.qml"
                Layout.preferredWidth: parent.width/4
                Layout.fillHeight: true
                color: "transparent"

                Rectangle {
                    id: settingBtn
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    width: 40; height: 40
                    color: settingBtnArea.containsMouse? "#FFFDE7" : "white"
                    radius: 20

                    Text {
                        anchors.centerIn: parent
                        text: "Set"
                    }

                    MouseArea {
                        id: settingBtnArea
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            console.log("LoginView.qml: click settingBtn. nextView is", nextView)
                            getNextView(nextView);
                        }
                    }
                }
            }
        }
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
