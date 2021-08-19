import QtQuick 2.0

Item {
    objectName: "chatView"

    // signals
    signal getNextView(var nextView);

    Rectangle {
        anchors.fill: parent
        Text {
            text: "test"
        }
    }
}
