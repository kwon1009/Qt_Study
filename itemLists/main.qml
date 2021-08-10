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
    property var mPhotoBox: 0

    Connector { id: connector }

    // signal
    signal sg_startTimer();
    signal sg_stopTimer();

    // slots
    // 5초마다 해당 timer 호출, 방향 전환
    function slot_timer() {
        console.log("main.qml time out, reverse direction")
        mPhotoBox.checkDirection(mPhotoBox.x, mPhotoBox.y)
    }

    id: mainWindow
    width: 400
    height: 600
    visible: true
    title: qsTr("Item Lists")


    Loader {
        id: firstView
        source: "showList.qml"  // firstView
        anchors.fill: parent
        visible: true
    }

    Loader {
        id: secondView
        source: "photoAni.qml"  // secondView
        anchors.fill: parent
        visible: false
    }
}
