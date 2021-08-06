#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QQuickWindow>
#include <QDir>

#include "FileIO.h"
#include "BtnImages.h"

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
    Q_INVOKABLE QVariant getImagePaths();
    Q_INVOKABLE void saveImages(QVariantList images);

private:
    QQuickWindow* mMainView;
    BtnImages* btnImages;

    int mSpacing = 6;   // 영역 분할 수
};

#endif // CONNECTOR_H
