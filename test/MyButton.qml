import QtQuick 2.0
import QtQuick.Controls 2.12

Button {
    property int btnNo: 0
    property string mPhotoPath: ""

    width: 200
    height: 200

    Image {
        fillMode: Image.PreserveAspectCrop
        source: mPhotoPath
        width: 100
        height: 100
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.y + 10
    }
}

