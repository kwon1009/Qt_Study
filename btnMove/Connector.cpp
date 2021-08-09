#include "Connector.h"

#include <QDebug>

Connector::Connector() {
    // initialization
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
    mJSONController = new JSONController(mSettingFile);

    // btn img setting
    QJsonObject btns = mJSONController->getJsonObj("btns"); // settings.txt 파일에서 btns 설정 정보 받아오기
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
    mJSONController->setJsonObj("btns", btns);
}

