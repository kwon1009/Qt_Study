#include "Connector.h"

Connector::Connector()
{
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
    timer = new MyTimer();
    mAirplane = new Airplane();
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
        mAirplane->setAirplaneView(airplaneView);
    }
}

void Connector::setConnection()
{
    // startView
    connect(mStartView, SIGNAL(sg_startBtnClick()), mMainView, SLOT(slot_changeView()));
    connect(mMainView, SIGNAL(sg_startTimer()), timer, SLOT(slot_start()));

    // airplane
    connect(timer, SIGNAL(timeout()), mAirplane, SLOT(slot_move()));
    connect(mAirplane, SIGNAL(sg_finish()), timer, SLOT(slot_finish()));
}



