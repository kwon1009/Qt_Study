#include "Connector.h"
#include <QFile>

#include <QDebug>

Connector::Connector() {
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
    fileIO = new FileIO(mFileName);
    setImages();
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
QVariant Connector::getImages() { return mItemList; }

void Connector::saveImages(QVariantList images) {
    fileIO->saveImages(images);
    mItemList = QVariant(images);
}

// public functions
void Connector::setImages() {
    QVariantList mPaths = {};
    QMap<int, QString> m = fileIO->getMatchings();
    for(int i=0; i<mSpacing; i++) {
        mPaths.append(mImageRoot + m[i]);
    }
    mItemList = QVariant(mPaths);
}
