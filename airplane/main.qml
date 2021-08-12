import QtQuick 2.12
import QtQuick.Window 2.12
import "."

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Airplane")

    // slots
    function slot_changeView() {
        console.log("change View")
        // !!실제 기능구현은 되어 있지 않음
        // !!현재 startView.startBtn에서만 발생되고 있음
        startView.visible = false
        airplanView.visible = true
    }

    Loader {
        id: startView
        source: "startView.qml"
        anchors.fill: parent
        focus: false
    }

    Loader {
        id: airplanView
        source: "airplaneView.qml"
        anchors.fill: parent
        visible: false
        focus: true
    }
}
