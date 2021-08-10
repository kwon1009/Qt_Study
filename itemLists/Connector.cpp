#include "Connector.h"

#include <QDebug>

Connector::Connector() {
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");

    setImages();
    setItemLists();

    timer = new QTimer(this);
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
        // !!점이 두개 이상 포함된 파일명을 조회하는 방법 찾기
        item.imagePath = mImageRoot + mImages[i];
        mItemList.push_back(item);
    }
}

void Connector::setConnection() {
    // QObject::connect
    // timer
    QObject::connect(mMainView, SIGNAL(sg_startTimer()), this, SLOT(slot_startTimer()));
    QObject::connect(timer, SIGNAL(timeout()), mMainView, SLOT(slot_timer()));
    QObject::connect(mMainView, SIGNAL(sg_stopTimer()), this, SLOT(slot_stopTimer()));

}


// qml onCompleted
int Connector::getItemListSize() { return mImages.size(); }
QString Connector::getPhotoTitle(int index) { return mItemList.at(index).title; }
QString Connector::getPhotoPath(int index) { return mItemList.at(index).imagePath; }


// slots
void Connector::slot_startTimer() {
    timer->start(5000);
    qDebug() << "Connector: Start timer.";
}
void Connector::slot_stopTimer() {
    timer->stop();
}
