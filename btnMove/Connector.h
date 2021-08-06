#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QQuickWindow>
#include <QDir>
#include <iostream>
using namespace std;

struct ItemStruct {
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

    // qml onCompleted
    Q_INVOKABLE QVariant getImages();

private:
    QQuickWindow* mMainView;

    QString mImageRoot = "./src/";  // 이미지 루트 폴더
    QVariant mItemList;  // 아이템 목록

    void setImages();
};

#endif // CONNECTOR_H
