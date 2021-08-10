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
    QObject::connect(mMainView, SIGNAL(sg_infiReverse()), this, SLOT(slot_startInfiReverse()));
    QObject::connect(timer, SIGNAL(timeout()), this, SLOT(slot_thisTime()));
    QObject::connect(this, SIGNAL(sg_checkTime()), mMainView, SLOT(slog_checkTime()));

}


// qml onCompleted
int Connector::getItemListSize() { return mImages.size(); }
QString Connector::getPhotoTitle(int index) { return mItemList.at(index).title; }
QString Connector::getPhotoPath(int index) { return mItemList.at(index).imagePath; }


// slots
void Connector::slot_startInfiReverse() {
    time = 0;
    qDebug() << "Connector: Start timer.";
    timer->start(1000);   // 시그널 받을 시, 타이머 동작 시작
}

void Connector::slot_thisTime() {
    time++;
    if(time == 5) {
        qDebug() << "Connector: Check 5 sec.";
        emit sg_checkTime();
        time = 0;
    }
}

