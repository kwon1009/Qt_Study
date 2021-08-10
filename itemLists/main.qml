import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Window 2.12
import QtQml 2.1

import Connector 1.0
import "./components"
import "./src"
import "."

Window {
    property int mPhotoSize: 0
    property string mPhotoPath: ""  // photoAni.qml -> photoBox

    Connector { id: connector }

    // signal
    signal sg_infiReverse();

    // slots
    function slog_checkTime() {
        // 5초마다 cpp에서 신호를 주면, 회전을 변환함
        console.log("Get check time Signal.")
    }

    property bool btnOneTimeClick: false
    property int time: 0
    function slot_timer() {
        time++
        console.log("main-timer:", time)
    }

    id: mainWindow
    width: 400
    height: 600
    visible: true
    title: qsTr("Item Lists")


    Loader {
        id: loaderView
        source: "showList.qml"  // firstView
        anchors.fill: parent
    }
}
