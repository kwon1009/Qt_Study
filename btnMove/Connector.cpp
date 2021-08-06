#include "Connector.h"

#include <QDebug>

Connector::Connector() {
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
    mJSONController = new JSONController(mSettingFile);

    QJsonObject btns = mJSONController->getJsonObj("btns");
    mBtnImages = new BtnImages(btns);
}

Connector::~Connector() {
}

// overriding
void Connector::setWindow(QQuickWindow* Window)
{
    mMainView = Window;
}

// qml onCompleted
int Connector::getSpacingSize() { return mSpacing; }
QVariant Connector::getImagePaths() {
    return mBtnImages->getImagePaths();
}

void Connector::saveImages(QVariantList images) {
    QJsonObject btns = mBtnImages->saveImages(images);
    mJSONController->write(btns);
}

