#include "Connector.h"

void Connector::setEngine(QQmlApplicationEngine* engine) {
    mEngine = engine;
    setObjects();
    setConnector();
}

void Connector::setObjects() {
    QObject* root = mEngine->rootObjects()[0];
    mMainWindow = qobject_cast<QQuickWindow*>(root);
}

void Connector::setConnector() {
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
}
