#include "Connector.h"

Connector::Connector()
{
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
//    timer = new MyTimer();
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

    // startBtn
    QObject *startBtn = root->findChild<QObject*>("startBtn");
    if(!startBtn) {
        qDebug() << "Connector: qml obj startBtn is not exist.";
    } else {
        mStartBtn = startBtn;
    }

    // race1
    QObject *rec1Race = root->findChild<QObject*>("rec1Race");
    if(!rec1Race) {
        qDebug() << "Connector: qml obj rec1Race is not exist.";
    } else {
        mRec1Race = rec1Race;
    }

    // race2
    QObject* rec2Race = root->findChild<QObject*>("rec2Race");
    if(!rec2Race) {
        qDebug() << "Connector: qml obj rec2Race is not exist.";
    } else {
        mRec2Race = rec2Race;
    }
}

void Connector::setConnection()
{
    // startView
//    connect(mStartView, SIGNAL(sg_startBtnClick()), mMainView, SLOT(slot_changeView()));
//    connect(mStartView, SIGNAL(sg_startBtnClick()), timer, SLOT(slot_start()));

//    // airplane
//    connect(timer, SIGNAL(timeout()), mAirplane, SLOT(slot_move()));
//    connect(mAirplaneView, SIGNAL(sg_pressSpace()), mAirplane, SLOT(slot_jump()));
//    connect(mAirplane, SIGNAL(sg_finish()), timer, SLOT(slot_finish()));
}
