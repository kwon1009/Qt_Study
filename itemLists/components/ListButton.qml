import QtQuick 2.0
import QtQuick.Controls 2.0

Button {
    width: 70
    height: 30
    anchors.centerIn: parent

    background: Rectangle {
        radius: 40
        color: parent.hovered? "#FF5252" : "#82B1FF"
    }
}

