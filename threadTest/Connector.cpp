#include "Connector.h"

Connector::Connector()
{
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
    timer1 = new MyTimer();

    timer = new QTimer(this);
    timerThread = new TimerThread();
}

Connector::~Connector() {}

void Connector::setWindow(QQuickWindow* Window)
{
    mMainView = Window;
}

void Connector::setConnection()
{
    connect(mMainView, SIGNAL(sg_clkStartBtn1()), this, SLOT(slot_startTimer()));
    connect(timer1, SIGNAL(timeout()), mMainView, SLOT(slot_showTime()));
//    connect(timer, SIGNAL(timeout()), timerThread, SLOT(start()));
//    connect(timerThread, SIGNAL(sg_tictok(QVariant)), mMainView, SLOT(slot_showTime(QVariant)));
//    connect(mMainView, SIGNAL(sg_clkStopBtn1()), this, SLOT(slot_stopTimer()));
}

void Connector::slot_startTimer() {
    timer1->start(1000);
}

void Connector::slot_stopTimer() {
    timer->stop();
}

void Connector::tictok()
{
    time++;
//    emit sg_tictok(QVariant(time));
    qDebug() << "time:" << time;
}
