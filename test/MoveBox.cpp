#include "MoveBox.h"
#include <QDebug>

MoveBox::MoveBox(QObject *recRace, QString name)
{
    mRecRace = recRace;
    mName = name;
    setConnection();
}

MoveBox::~MoveBox()
{
    qDebug() << Q_FUNC_INFO;
}

void MoveBox::run()
{
    mX = 0;
    while(isRunning()) {
        if ( QThread::currentThread()->isInterruptionRequested() ) {
            qDebug() << Q_FUNC_INFO << " terminated";
            return;
        }

        auto rand = QRandomGenerator::global()->bounded(0, 30);
        mX += rand;
        checkXY();
        msleep(100);
//        qDebug() << "MoveBox: x plus" << rand;
    }
}

void MoveBox::setConnection() {
    connect(this, SIGNAL(sg_setXY(QVariant, QVariant)), mRecRace, SLOT(slot_setXY(QVariant, QVariant)));
    connect(this, SIGNAL(sg_finish(QString)), this, SLOT(slot_stop(QString)));
}

void MoveBox::checkXY() {
    if(mX >= mFinish) {
        qDebug() << "MoveBox: Finish";
        mX = mFinish;
        emit sg_finish(mName);
    }
    emit sg_setXY(QVariant(mX), QVariant(mY));
}

void MoveBox::slot_stop(QString name) {
    requestInterruption();
    qDebug() << "MoveBox: slot_stop" << name;
}
