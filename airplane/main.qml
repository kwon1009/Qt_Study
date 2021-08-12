import QtQuick 2.12
import QtQuick.Window 2.12
import "."

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Airplane")

    Loader {
        objectName: "airplaneView"
        source: "airplaneView.qml"
        anchors.fill: parent
        visible: true
    }
}
