import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 400
    height: 600
    title: qsTr("Chatting")

    // slots
    function changeView(viewName) {
        mainView.source = viewName;
        console.log("main.qml: change view ->", viewName)
    }

    Loader {
        id: mainView;
        anchors.fill: parent
        source: "loginView.qml"
    }
}
