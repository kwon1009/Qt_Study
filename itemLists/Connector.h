#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QQuickWindow>
#include <QDir>
#include <iostream>
using namespace std;

struct ItemStruct {
//    Q_GADGET

//public:
    QString title;
    QString imagePath;
};

class Connector : public QObject {
    Q_OBJECT

public:
    Connector();
    ~Connector();

    // overriding
    void setWindow(QQuickWindow* Widnow);

    void setConnection();

//    Q_INVOKABLE QVector<ItemStruct> getItems(); // struct list를 직접 보내는 방법 확인하기

    // qml onCompleted
    Q_INVOKABLE int getItemListSize();
    Q_INVOKABLE QString getPhotoTitle(int index);
    Q_INVOKABLE QString getPhotoPath(int index);

//    void setObject(QObject* obj);

private:
    QQuickWindow* mMainView;

    QString mImageRoot = "./src/";  // 이미지 루트 폴더
    QVector<QString> mImages;       // 이미지 목록
    QVector<ItemStruct> mItemList;  // 아이템 목록

    void setImages();
    void setItemLists();
};


#endif // CONNECTOR_H
