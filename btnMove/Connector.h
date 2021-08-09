#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QQuickWindow>
#include <QDir>

#include "JSONController.h"
#include "BtnImages.h"

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
    QString mSettingFile = "settings.json";

    QQuickWindow* mMainView;
    JSONController* mJSONController;
    BtnImages* mBtnImages;

    int mSpacing = 6;   // 영역 분할 수
};

#endif // CONNECTOR_H
