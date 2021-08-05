#include "Connector.h"

#include <QDebug>

Connector::Connector() {
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
}

Connector::~Connector() {

}

// overriding
void Connector::setWindow(QQuickWindow* Window)
{
    mMainView = Window;
}

// public function
void Connector::setConnection() {
//    QObject::connect(mMainView, SIGNAL(sg_setPhotos()), this, SLOT(slot_setPhotos()));
//    QObject::connect(this, SIGNAL(sg_photos(QVariant)), mMainView, SLOT(slot_photos(QVariant)));

}


// slots
void Connector::slot_setPhotos() {
    // 사진 자동으로 받아오도록 하기
    QVariantList setPhotos = {
        "./src/Kittens.jpg",
        "./src/So cute.jpg",
        "./src/HamZzi.jpg",
        "./src/What.jpg",
        "./src/Thinking.jpg"
    };
    QVariant photos = QVariant(setPhotos);
    emit sg_photos(photos);
}
