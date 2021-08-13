#include "Connector.h"

Connector::Connector()
{
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
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
        mMoveBox1 = new MoveBox(rec1Race, "A");
    }

    // race2
    QObject* rec2Race = root->findChild<QObject*>("rec2Race");
    if(!rec2Race) {
        qDebug() << "Connector: qml obj rec2Race is not exist.";
    } else {
        mMoveBox2 = new MoveBox(rec2Race, "B");
    }
}

void Connector::setConnection()
{
    // startView
    connect(mMainView, SIGNAL(sg_start()), mMoveBox1, SLOT(start()));
    connect(mMainView, SIGNAL(sg_start()), mMoveBox2, SLOT(start()));

    // finish
    connect(mMoveBox1, SIGNAL(sg_finish(QString)), this, SLOT(slot_finish(QString)));
    connect(mMoveBox2, SIGNAL(sg_finish(QString)), this, SLOT(slot_finish(QString)));
    connect(this, SIGNAL(sg_winner(QVariant)), mMainView, SLOT(slot_winner(QVariant)));
}

void Connector::slot_finish(QString name) {
    mBoxRank.push_back(name);
    qDebug() << mBoxRank.size() << mBoxRank;

    if(mBoxRank.size() == mBoxNum) {
        qDebug() << "Connector: Winner is" << mBoxRank[0];
        emit sg_winner(QVariant(mBoxRank));
    }
}
