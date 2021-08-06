#include "Connector.h"

#include <QDebug>

Connector::Connector() {
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
    btnImages = new BtnImages();
}

Connector::~Connector() {

}

// overriding
void Connector::setWindow(QQuickWindow* Window)
{
    mMainView = Window;
}

// qml onCompleted
int Connector::getSpacingSize() { return mSpacing; }
QVariant Connector::getImagePaths() { return btnImages->getImagePaths(); }

void Connector::saveImages(QVariantList images) {
    btnImages->saveImages(images);
}

