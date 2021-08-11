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
void Connector::setWindow()
{
    // mainView
    QObject *root = mEngine->rootObjects()[0];
    mMainView = qobject_cast<QQuickWindow *>(root);

    // firstView (ObjectName)
    QObject *first = root->findChild<QObject*>("firstView");
    if(!first) {
        qDebug() << "Connector: firstView is not exist.";
    } else {
        firstView = first;
    }

    // secondView (ObjectName)
    QObject *second = root->findChild<QObject*>("secondView");
    if(!second) {
        qDebug() << "Connector: SecondView is not exist.";
    } else {
        secondView = second;
    }
}

void Connector::setEngine(QQmlApplicationEngine* engine) {
    mEngine = engine;
    setWindow();
    setConnection();
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

    // animation moving start
    QObject::connect(firstView, SIGNAL(sg_startAni()), secondView, SLOT(slot_startAni()));

    // test
    QObject::connect(secondView, SIGNAL(sg_test()), this, SLOT(slot_test()));
}

void Connector::slot_test() {
    qDebug() << "secondView test";
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
