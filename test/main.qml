import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import "."

Window {
    width: 1000
    height: 400
    visible: true

    // slots
    function slot_time() {
        console.log("tic tok")
    }

    Rectangle {
        width: parent.width
        height: 30
        Text {
            text: "test"
        }
    }
}
