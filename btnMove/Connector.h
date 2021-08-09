#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QQuickWindow>
#include <QDir>

#include "JSONController.h"
#include "BtnImages.h"

const QStringList SETTING_TITLES = { "path", "btns" };
const QString SETTING_FILE = "../settings.json";

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
    JSONController* mJSONController;
    BtnImages* mBtnImages;

    int mSpacing = 6;   // 영역 분할 수
};

#endif // CONNECTOR_H
