#include "Connector.h"

Connector::Connector()
{
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
    timer1 = new MyTimer();
    timer2 = new MyTimer();
}

Connector::~Connector() {}

void Connector::setWindow(QQuickWindow* Window)
{
    mMainView = Window;
}

void Connector::setConnection()
{
    // timer1
    connect(mMainView, SIGNAL(sg_clkStartBtn1()), this, SLOT(slot_startTimer1()));
    connect(timer1, SIGNAL(timeout()), mMainView, SLOT(slot_showTime1()));
    connect(mMainView, SIGNAL(sg_clkStopBtn1()), this, SLOT(slot_stopTimer1()));

    // timer2
    connect(mMainView, SIGNAL(sg_clkStartBtn2()), this, SLOT(slot_startTimer2()));
    connect(timer2, SIGNAL(timeout()), mMainView, SLOT(slot_showTime2()));
    connect(mMainView, SIGNAL(sg_clkStopBtn2()), this, SLOT(slot_stopTimer2()));
}

void Connector::slot_startTimer1() {
    timer1->start(1000);
}

void Connector::slot_stopTimer1() {
    timer1->stop();
}

void Connector::slot_startTimer2() {
    timer2->start(1000);
}

void Connector::slot_stopTimer2() {
    timer2->stop();
}

