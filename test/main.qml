import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "."

Window {
    property variant mPhotoPaths: [
        "./src/Kittens.jpg",
        "./src/So cute.jpg",
        "./src/HamZzi.jpg"]

    width: 1000
    height: 400
    visible: true

    MyButton {
        id: btn1
        btnNo: 0
        mPhotoPath: mPhotoPaths[0]
    }

    MyButton {
        btnNo: 1
        id: btn2
        mPhotoPath: mPhotoPaths[1]
    }

    MyButton {
        btnNo: 2
        id: btn3
        mPhotoPath: mPhotoPaths[2]
    }
}
