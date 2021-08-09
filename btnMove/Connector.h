#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QQuickWindow>
#include <QDir>

#include "ErrorController.h"
#include "JSONController.h"
#include "BtnImages.h"

const QStringList SETTING_TITLES = { "path", "btns" };
const QString SETTING_FILE = "../settings.json";

class Connector : public QObject {
    Q_OBJECT

private:
    QQuickWindow* mMainView;
    ErrorController* mErrorController;
    JSONController* mJSONController;
    BtnImages* mBtnImages;

    int mSpacing = 6;   // 영역 분할 수

public:
    Connector();
    ~Connector();

    // overriding
    void setWindow(QQuickWindow* Widnow);

    void setConnection();

    // qml onCompleted
    Q_INVOKABLE int getSpacingSize();
    Q_INVOKABLE QVariant getImagePaths();
    Q_INVOKABLE void saveImages(QVariantList images);
};

#endif // CONNECTOR_H
