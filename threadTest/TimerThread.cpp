
#include <QDebug>
#include "TimerThread.h"


TimerThread::TimerThread()
{
    QString result;
    time = 0;
}

TimerThread::~TimerThread()
{
    qDebug() << Q_FUNC_INFO;
}

void TimerThread::run() {
    time++;
    qDebug() << time << "timer start";
    emit sg_tictok(QVariant(time));
}




//void TimerThread::slot_checkTime() {
//    QString result;

//    timer = new QTimer(this);
//    connect(timer, SIGNAL(timeout()), this, SLOT(tiktok()));
//    timer->start(1000);

//    if ( QThread::currentThread()->isInterruptionRequested() ) {
//        qDebug() << Q_FUNC_INFO << " terminated";
//        emit sg_resultReady(result);
//        return;
//    }
//}
