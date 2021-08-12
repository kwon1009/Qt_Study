import QtQuick 2.12
import QtQuick.Window 2.12
import "."

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Airplane")

    Loader {
        id: startView
        objectName: "startView"
        source: "startView.qml"
        anchors.fill: parent

        // signals
        signal sg_startBtnClick();
        signal sg_start();

        // slots
        function sg_changeView() {
            console.log("change View")
            // !!실제 기능구현은 되어 있지 않음
            // !!현재 startView.startBtn에서만 발생되고 있음
            startView.visible = false
            airplanView.visible = true
            airplanView.focus = true
            sg_start();
        }
    }

    Loader {
        id: airplanView
        objectName: "airplaneView"
        source: "airplaneView.qml"
        anchors.fill: parent
        visible: false

        // signals
        signal sg_pressSpace();

        focus: false
        Keys.onPressed: {
            if(event.key == Qt.Key_Space) {
                console.log("airplaneView.qml: key Space press");
                sg_pressSpace();
            }
        }
    }
}
