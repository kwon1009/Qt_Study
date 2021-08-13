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

    // race
    QObject *recRace;
    for(int i=0; i<BOX_NUMBER; i++) {
        recRace = root->findChild<QObject*>(OBJECT_NAMES[i]);
        MoveBox* moveBox = new MoveBox(recRace, REC_NAMES[i]);
        mMoveBoxs.push_back(moveBox);
    }
}

void Connector::setConnection()
{
    for(int i=0; i<BOX_NUMBER; i++) {
        connect(mMainView, SIGNAL(sg_start()), mMoveBoxs[i], SLOT(start()));
        connect(mMoveBoxs[i], SIGNAL(sg_finish(QString)), this, SLOT(slot_finish(QString)));
    }

    connect(this, SIGNAL(sg_winner(QVariant)), mMainView, SLOT(slot_winner(QVariant)));
}

void Connector::slot_finish(QString name) {
    mBoxRank.push_back(name);
    qDebug() << mBoxRank.size() << mBoxRank;

    if(mBoxRank.size() == BOX_NUMBER) {
        qDebug() << "Connector: Winner is" << mBoxRank[0];
        emit sg_winner(QVariant(mBoxRank));
        while(mBoxRank.size() > 0)
            mBoxRank.pop_front();
    }
}

QVariant Connector::getObjNames() { return QVariant(OBJECT_NAMES); }
QVariant Connector::getNames() { return QVariant(REC_NAMES); }
QVariant Connector::getColors() { return QVariant(REC_COLORS); }
