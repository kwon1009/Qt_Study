import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3

Window {
    width: 400
    height: 500
    visible: true
    title: qsTr("Find Bumb")

    property int mColNum: 2
    property int mRowNum: 2

    Item {
        width: 350
        height: 350
        anchors.centerIn: parent

        ColumnLayout {
            anchors.fill: parent
            spacing: mRowNum

            RowLayout {
                Layout.preferredHeight: parent.height/mRowNum
                Layout.preferredWidth: parent.width

                Component {
                    id: rowLayoutComponent

                    Rectangle {
                        border.width: 1
                        border.color: "gray"
                        color: "yellow"
                    }
                }

                Loader {
                    Layout.preferredHeight: parent.height
                    Layout.preferredWidth: parent.width/mColNum
                    sourceComponent: rowLayoutComponent
                }
            }

            RowLayout {
                Layout.preferredHeight: parent.height/mRowNum
                Layout.preferredWidth: parent.width

                Rectangle {
                    Layout.preferredHeight: parent.height
                    Layout.preferredWidth: parent.width/mColNum
                    border.width: 1
                    border.color: "gray"
                    color: "yellow"
                }

                Rectangle {
                    Layout.preferredHeight: parent.height
                    Layout.preferredWidth: parent.width/mColNum
                    border.width: 1
                    border.color: "gray"
                    color: "yellow"
                }
            }
        }
    }

//    ColumnLayout {
//        anchors.fill: parent
//        spacing: mRowNum

//        RowLayout {
//            Layout.fillWidth: true
//            Layout.preferredHeight: parent.height/mRowNum
//            spacing: mColNum

//            Rectangle {
//                Layout.preferredHeight: parent.height
//                Layout.preferredWidth: parent.width/mColNum
//                color: "yellow"
//                border.width: 1
//                border.color: "gray"
//            }

//            Rectangle {
//                Layout.preferredHeight: parent.height
//                Layout.preferredWidth: parent.width/mColNum
//                color: "yellow"
//                border.width: 1
//                border.color: "gray"
//            }
//        }

//        RowLayout {
//            Layout.fillWidth: true
//            Layout.preferredHeight: parent.height/mRowNum
//            spacing: mColNum

//            Rectangle {
//                Layout.preferredHeight: parent.height
//                Layout.preferredWidth: parent.width/mColNum
//                color: "yellow"
//                border.width: 1
//                border.color: "gray"
//            }

//            Rectangle {
//                Layout.preferredHeight: parent.height
//                Layout.preferredWidth: parent.width/mColNum
//                color: "yellow"
//                border.width: 1
//                border.color: "gray"
//            }
//        }
//    }
}
