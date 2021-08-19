import QtQuick 2.0
import QtQuick.Layouts 1.2
import "."

Item {
    objectName: "chatListView"
    property int titleBarHeight: 50
    property string titleName: "Chatting List"
    property var chatProfilePath: "./src/Happy dog.jpg"    // photoPath setting

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
                property var nextView: "loginView.qml"
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
                            console.log("chatListView.qml: click prevBtn. nextView is", nextView)
                            getNextView(nextView);
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

        // component
        Rectangle {

            width: parent.width
            height: 80
            border.width: 1
            border.color: "gray"
            color: "transparent"

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
                            source: chatProfilePath
                        }
                    }
                }

                // chat data
                Rectangle {
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width - 150
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
                                text: "어니부기"
                                font.bold: true
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: parent.width
                            Layout.preferredHeight: 40
                            color: "transparent"

                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                text: "Hello. Qt coding."
                            }
                        }
                    }
                }

                // chat time
                Rectangle {
                    Layout.fillHeight: true
                    Layout.preferredWidth: 70
                    color: "transparent"

                    Text {
                        anchors.centerIn: parent
                        text: "2021.08.19"
                        color: "gray"
                    }
                }
            }
        }
    }
}
