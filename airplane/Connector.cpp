#include "Connector.h"

Connector::Connector()
{
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
}

Connector::~Connector() {}

void Connector::setEngine(QQmlApplicationEngine* engine) {
    mEngine = engine;
    setWindow();
    setConnection();
}

void Connector::setWindow()
{
    // mainView
    QObject *root = mEngine->rootObjects()[0];
    mMainView = qobject_cast<QQuickWindow *>(root);
}

void Connector::setConnection()
{

}



