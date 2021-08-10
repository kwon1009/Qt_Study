#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QQuickWindow>
#include <QDir>
#include <iostream>
#include "MyTimer.h"
using namespace std;

struct ItemStruct {
    QString title;
    QString imagePath;
};

class Connector : public QObject {
    Q_OBJECT

private:
    QQuickWindow* mMainView;
    QTimer* timer;
    int time;

    QString mImageRoot = "../src/";  // 이미지 루트 폴더
    QVector<QString> mImages;       // 이미지 목록
    QVector<ItemStruct> mItemList;  // 아이템 목록

    void setImages();
    void setItemLists();

public:
    Connector();
    ~Connector();

    // overriding
    void setWindow(QQuickWindow* Widnow);

    void setConnection();

    // qml onCompleted
    Q_INVOKABLE int getItemListSize();
    Q_INVOKABLE QString getPhotoTitle(int index);
    Q_INVOKABLE QString getPhotoPath(int index);

signals:
    void sg_checkTime();

private slots:
    void slot_startInfiReverse();
    void slot_thisTime();
};


#endif // CONNECTOR_H
