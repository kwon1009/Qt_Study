import QtQuick 2.0
import QtQuick.Layouts 1.2

Rectangle {
    id: titleBar
    anchors.top: parent.top
    anchors.left: parent.left
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
                        console.log("TitleBar.qml: click prevBtn. nextView is", prevView)
                        getNextView(prevView);
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
            Layout.preferredWidth: parent.width/4
            Layout.fillHeight: true
            color: "transparent"

            Rectangle {
                id: rightBtn
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                width: 40; height: 40
                color: rightBtnArea.containsMouse? "#FFFDE7" : "white"
                radius: 20

                Text {
                    anchors.centerIn: parent
                    text: rightBtnTxt
                }

                MouseArea {
                    id: rightBtnArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        console.log("TitleBar.qml: click settingBtn. nextView is", rightBtnView)
                        getNextView(rightBtnView);
                    }
                }
            }
        }
    }
}
