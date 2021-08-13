#include "MoveBox.h"
#include <QDebug>

MoveBox::MoveBox(QObject *recRace)
{
    mRecRace = recRace;
    setConnection();
}

MoveBox::~MoveBox()
{
    qDebug() << Q_FUNC_INFO;
}

void MoveBox::run()
{
    while(isRunning()) {
        auto rand = QRandomGenerator::global()->bounded(0, 20);
        mX += rand;
        checkXY();
        msleep(100);
        qDebug() << rand;

        if ( QThread::currentThread()->isInterruptionRequested() ) {
            qDebug() << Q_FUNC_INFO << " terminated";
            return;
        }
    }
    qDebug() << "End Run";
}

void MoveBox::setConnection() {
    connect(this, SIGNAL(sg_setXY(QVariant, QVariant)), mRecRace, SLOT(slot_setXY(QVariant, QVariant)));
    connect(this, SIGNAL(sg_finish()), this, SLOT(slot_stop()));
}

void MoveBox::checkXY() {
    if(mX >= mFinish) {
        qDebug() << "MoveBox: Finish";
        emit sg_finish();
    } else {
        emit sg_setXY(QVariant(mX), QVariant(mY));
    }
}

void MoveBox::slot_stop() {
    requestInterruption();
    qDebug() << "stop";
}
