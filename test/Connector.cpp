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

    // race1
    QObject *rec1Race = root->findChild<QObject*>("rec1Race");
    if(!rec1Race) {
        qDebug() << "Connector: qml obj rec1Race is not exist.";
    } else {
        mMoveBox1 = new MoveBox(rec1Race);
    }

    // race2
    QObject* rec2Race = root->findChild<QObject*>("rec2Race");
    if(!rec2Race) {
        qDebug() << "Connector: qml obj rec2Race is not exist.";
    } else {
        mMoveBox2 = new MoveBox(rec2Race);
    }
}

void Connector::setConnection()
{
    // startView
    connect(mMainView, SIGNAL(sg_start()), mMoveBox1, SLOT(start()));
    connect(mMainView, SIGNAL(sg_start()), mMoveBox2, SLOT(start()));
}
