import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import "."

Window {
    width: 400
    height: 600
    visible: true
    title: qsTr("Hello World")

    ColumnLayout {
        anchors.fill: parent
        spacing: 2

        // timer1
        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillHeight: true
            Layout.preferredWidth: 300
            Layout.margins: 10

            MyTimerBox { objectName: "timer1" }
        }

        // timer2
        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillHeight: true
            Layout.preferredWidth: 300
            Layout.margins: 10

            MyTimerBox { objectName: "timer2" }
        }
    }

}
