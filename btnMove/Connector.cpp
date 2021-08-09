#include "Connector.h"

#include <QDebug>
#include "FileIO.h"
#include <QDir>

Connector::Connector() {
    // initialization
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
    mErrorController = new ErrorController();

    try {
        // setting files
        mJSONController = new JSONController(SETTING_TITLES, SETTING_FILE);

        // btn img setting
        QString imgPath = mJSONController->getJsonObj("path")["img"].toString();
        QJsonObject btns = mJSONController->getJsonObj("btns");     // settings.txt 파일에서 btns 설정 정보 받아오기
        mBtnImages = new BtnImages(imgPath, btns);
    } catch (errors err) {
        mErrorController->getError(err);
    }
}

Connector::~Connector() {
    mJSONController->~JSONController();
}

// overriding
void Connector::setWindow(QQuickWindow* Window)
{
    mMainView = Window;
}

void Connector::setConnection() {
    QObject::connect(mErrorController, SIGNAL(sg_printError(QVariant)), mMainView, SLOT(slot_showError(QVariant)));
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

