import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Window 2.12
import QtQml 2.1

import Connector 1.0
import "./components"
import "./src"
import "."

Window {

    Connector { id: connector }

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
