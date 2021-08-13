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

    // race3
    QObject* rec3Race = root->findChild<QObject*>("rec3Race");
    if(!rec3Race) {
        qDebug() << "Connector: qml obj rec3Race is not exist.";
    } else {
        mMoveBox3 = new MoveBox(rec3Race, "C");
    }

    // race4
    QObject* rec4Race = root->findChild<QObject*>("rec4Race");
    if(!rec4Race) {
        qDebug() << "Connector: qml obj rec4Race is not exist.";
    } else {
        mMoveBox4 = new MoveBox(rec4Race, "D");
    }

    // race2
    QObject* rec5Race = root->findChild<QObject*>("rec5Race");
    if(!rec5Race) {
        qDebug() << "Connector: qml obj rec5Race is not exist.";
    } else {
        mMoveBox5 = new MoveBox(rec5Race, "E");
    }
}

void Connector::setConnection()
{
    // startView
    connect(mMainView, SIGNAL(sg_start()), mMoveBox1, SLOT(start()));
    connect(mMainView, SIGNAL(sg_start()), mMoveBox2, SLOT(start()));
    connect(mMainView, SIGNAL(sg_start()), mMoveBox3, SLOT(start()));
    connect(mMainView, SIGNAL(sg_start()), mMoveBox4, SLOT(start()));
    connect(mMainView, SIGNAL(sg_start()), mMoveBox5, SLOT(start()));

    // finish
    connect(mMoveBox1, SIGNAL(sg_finish(QString)), this, SLOT(slot_finish(QString)));
    connect(mMoveBox2, SIGNAL(sg_finish(QString)), this, SLOT(slot_finish(QString)));
    connect(mMoveBox3, SIGNAL(sg_finish(QString)), this, SLOT(slot_finish(QString)));
    connect(mMoveBox4, SIGNAL(sg_finish(QString)), this, SLOT(slot_finish(QString)));
    connect(mMoveBox5, SIGNAL(sg_finish(QString)), this, SLOT(slot_finish(QString)));
    connect(this, SIGNAL(sg_winner(QVariant)), mMainView, SLOT(slot_winner(QVariant)));
}

void Connector::slot_finish(QString name) {
    mBoxRank.push_back(name);
    qDebug() << mBoxRank.size() << mBoxRank;

    if(mBoxRank.size() == mBoxNum) {
        qDebug() << "Connector: Winner is" << mBoxRank[0];
        emit sg_winner(QVariant(mBoxRank));
        while(mBoxRank.size() > 0)
            mBoxRank.pop_front();
    }
}
