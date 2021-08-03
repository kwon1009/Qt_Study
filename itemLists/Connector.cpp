#include "Connector.h"

#include <QDebug>

Connector::Connector() {
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
//    qRegisterMetaType<ItemStruct>("ItemStruct");    // getItems() 사용 위함

    setImages();
    setItemLists();
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
        item.title = QString("%1")
                .arg(mImages[i].split(".", QString::SkipEmptyParts).at(0));
        // 점이 두개 이상 포함된 파일명을 조회하는 방법 찾기
        item.imagePath = mImageRoot + mImages[i];
        mItemList.push_back(item);
    }
}

void Connector::setConnection() {
    // QObject::connection을 모아놓는 곳
}


// private functions
//QVector<ItemStruct> Connector::getItems() {
//    return mItemList;
//}


// qml onCompleted
int Connector::getItemListSize() { return mImages.size(); }
QString Connector::getPhotoTitle(int index) { return mItemList.at(index).title; }
QString Connector::getPhotoPath(int index) { return mItemList.at(index).imagePath; }


