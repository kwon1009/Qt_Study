#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QQuickWindow>
#include <QDir>
#include <iostream>

#include "FileIO.h"
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
    Q_INVOKABLE int getSpacingSize();
    Q_INVOKABLE QVariant getImages();
    Q_INVOKABLE void saveImages(QVariantList images);

private:
    QQuickWindow* mMainView;
    FileIO* fileIO;
    QString mFileName = "matching.txt"; // 버튼 정렬 매칭 파일
    QStringList matchings;     // 버튼 이미지 매칭 목록

    int mSpacing = 6;
    QString mImageRoot = "./src/";  // 이미지 루트 폴더
    QVariant mItemList;  // 아이템 목록

    void setImages();
};

#endif // CONNECTOR_H
