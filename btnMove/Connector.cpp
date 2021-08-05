#include "Connector.h"

#include <QDebug>

Connector::Connector() {
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
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
QVariant Connector::getImages() { return mItemList; }

// public functions
void Connector::setImages()
{
    // get File names
    QDir directory(mImageRoot);
    QStringList images = directory.entryList(QStringList() << "*", QDir::Files);

    // push names and path
    QVariantList mPaths = {};
    foreach(QString filename, images) {
        mPaths.append(mImageRoot + filename);
    }
    mItemList = QVariant(mPaths);
}
