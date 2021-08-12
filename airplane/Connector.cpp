#include "Connector.h"

Connector::Connector()
{
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
    timer = new MyTimer();
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

    // airplane1
    QObject* airplane1 = root->findChild<QObject*>("airplane1");
    if(!airplane1) {
        qDebug() << "Connector: obj airplane1 is not exist.";
    } else {
        mAirplane1 = airplane1;
    }
}

void Connector::setConnection()
{
    // timer
    connect(timer, SIGNAL(timeout()), mAirplane1, SLOT(slot_move()));
}



