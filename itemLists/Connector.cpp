#include "Connector.h"

#include <QDebug>

Connector::Connector() {
    setImages();
    setItemLists();
    setConnection();
}

Connector::~Connector() {

}

// overriding
void Connector::setWindow(QQuickWindow* Window)
{
    mMainView = Window;
}


// public functions
void Connector::setImages()
{
    // get File names
    QDir directory(mImageRoot);
    QStringList images = directory.entryList(QStringList() << "*", QDir::Files);

    // push names
    foreach(QString filename, images) {
        mImages.push_back(filename);
    }
}

void Connector::setItemLists()
{
    ItemStruct item;
    for(int i=0; i<mImages.size(); i++) {
        item.no = i;
        item.title = QString("%1")
                .arg(mImages[i].split(".", QString::SkipEmptyParts).at(0));
        // 점이 두개 이상 포함된 파일명을 조회하는 방법 찾기
        item.imagePath = mImageRoot + mImages[i];
        mItemList.push_back(item);
    }
}

void Connector::setConnection() {
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
}


// private functions
QVector<ItemStruct> Connector::getItems() {
    return mItemList;
}
