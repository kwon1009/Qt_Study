import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Window 2.12
import QtQml 2.1
//import Connector 1.0
// import 오류 발생
import "."

Window {
//    width: 400
//    height: 600
//    visible: true
//    title: qsTr("Item Lists")

    id: photo_info;
    width: 400
    height: 600
    visible: true
    title: qsTr("Photo Info")

    Item {
        id: base
        width: 400
        height : 600

        Rectangle{
            id: photo
            objectName: "myrect"    //??
            color : "gray"
            width: 100
            height: 100
            x : 0
            y : 0

            SequentialAnimation {
                running: true
                loops: Animation.Infinite;

                NumberAnimation {
                    target: photo
                    property: "x"
                    from : 0
                    to : 300
                    duration: 3000
                }

                NumberAnimation {
                    target: photo
                    property: "y"
                    from : 0
                    to : 500
                    duration: 5000
                }

                NumberAnimation {
                    target: photo
                    property: "x"
                    from : 300
                    to : 0
                    duration: 3000
                }

                NumberAnimation {
                    target: photo
                    property: "y"
                    from : 500
                    to : 0
                    duration: 5000
                }
            }
        }
    }
}
