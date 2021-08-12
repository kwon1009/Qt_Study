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

    // airplane
    QObject* airplane = airplaneView->findChild<QObject*>("airplane");
    if(!airplane) {
        qDebug() << "Connector: qml obj airplane is not exist.";
    } else {
        mAirplane = new Airplane(airplane);
    }
}

void Connector::setConnection()
{
    // startView
    connect(mStartView, SIGNAL(sg_startBtnClick()), mMainView, SLOT(slot_changeView()));
    connect(mStartView, SIGNAL(sg_startBtnClick()), timer, SLOT(slot_start()));

    // airplane
    connect(timer, SIGNAL(timeout()), mAirplane, SLOT(slot_move()));
    connect(mAirplaneView, SIGNAL(sg_pressSpace()), mAirplane, SLOT(slot_jump()));
    connect(mAirplane, SIGNAL(sg_finish()), timer, SLOT(slot_finish()));
}



