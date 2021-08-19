#include "connector.h"

Connector::Connector(QQmlApplicationEngine* engine) {
    mEngine = engine;

    setViews();
    setConnections();
}

void printObjectIsNotFound(QString objName) {
    qDebug() << QString("Connector: %1 is not exist.").arg(objName);
}

void Connector::setViews() {
    // mainView
    QObject *root = mEngine->rootObjects()[0];
    mMainWindow = qobject_cast<QQuickWindow *>(root);

    // first view : login view
    QObject* thisView = mMainWindow->findChild<QObject*>("loginView");
    if(!thisView) printObjectIsNotFound("loginView");
    else    mThisView = thisView;


}

void Connector::setConnections() {
    // loginView
    connect(mThisView, SIGNAL(getNextView(QVariant)), mMainWindow, SLOT(changeView(QVariant)));
    connect(mThisView, SIGNAL(getNextView(QVariant)), this, SLOT(setNextView(QVariant)));
}

void Connector::test() {
    qDebug() << "Connector: slot test";
}


void Connector::setNextView(QVariant nextView) {
    // set next view
    QString nextViewObj = nextView.toString().chopped(4);
    QObject* thisView = mMainWindow->findChild<QObject*>(nextViewObj);
    if(!thisView) printObjectIsNotFound(nextViewObj);
    else mThisView = thisView;

    qDebug() << "Connector: change view ->" << nextView.toString();
}
