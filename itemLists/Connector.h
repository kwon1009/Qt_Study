#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QQuickWindow>
#include <QDir>

struct ItemStruct {
    int no;
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

    QVector<ItemStruct> getItems();

private:
    QQuickWindow* mMainView;        // connection을 위한 윈도우

    QString mImageRoot = "./src/";// 이미지 루트 폴더
    QVector<QString> mImages;     // 이미지 경로
    QVector<ItemStruct> mItemList;   // 아이템 목록

    void setImages();
    void setItemLists();
    void setConnection();
};


#endif // CONNECTOR_H
