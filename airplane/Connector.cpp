#include "Connector.h"

Connector::Connector()
{
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
    timer = new MyTimer();
}

Connector::~Connector() {}

void Connector::setEngine(QQmlApplicationEngine* engine) {
    mEngine = engine;
    setObjects();
    setConnection();
}

void Connector::setObjects()
{
    // mainView
    QObject *root = mEngine->rootObjects()[0];
    mMainView = qobject_cast<QQuickWindow *>(root);

    // startView
    QObject *startView = root->findChild<QObject*>("startView");
    if(!startView) {
        qDebug() << "Connector: qml obj startView is not exist.";
    } else {
        mStartView = startView;
    }

    // airplaneView
    QObject *airplaneView = root->findChild<QObject*>("airplaneView");
    if(!airplaneView) {
        qDebug() << "Connector: qml obj airplaneView is not exist.";
    } else {
        mAirplaneView = airplaneView;
    }

    // airplane1
    QObject* airplane1 = root->findChild<QObject*>("airplane1");
    if(!airplane1) {
        qDebug() << "Connector: qml obj airplane1 is not exist.";
    } else {
        mAirplane1 = airplane1;
    }
}

void Connector::setConnection()
{
    // startView
    connect(mStartView, SIGNAL(sg_startBtnClick()), mStartView, SLOT(sg_changeView()));
    connect(mStartView, SIGNAL(sg_start()), timer, SLOT(slot_start()));

    // timer
    connect(timer, SIGNAL(timeout()), mAirplane1, SLOT(slot_move()));
    connect(mAirplane1, SIGNAL(sg_finish()), timer, SLOT(slot_finish()));

    // airplaneView
    connect(mAirplaneView, SIGNAL(sg_pressSpace()), mAirplane1, SLOT(slot_pressSpace()));
}



