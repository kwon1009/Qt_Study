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
    connect(mMainView, SIGNAL(sg_clkStartBtn1()), timer1, SLOT(slot_startTimer()));
    connect(timer1, SIGNAL(timeout()), timer1, SLOT(slot_setTime()));
    connect(timer1, SIGNAL(sg_thisTime(QVariant)), mMainView, SLOT(slot_thisTime1(QVariant)));

    connect(mMainView, SIGNAL(sg_clkStopBtn1()), timer1, SLOT(stop()));
    connect(mMainView, SIGNAL(sg_clkResetBtn1()), timer1, SLOT(slot_resetTimer()));

    // timer2
    connect(mMainView, SIGNAL(sg_clkStartBtn2()), timer2, SLOT(slot_startTimer()));
    connect(timer2, SIGNAL(timeout()), timer2, SLOT(slot_setTime()));
    connect(timer2, SIGNAL(sg_thisTime(QVariant)), mMainView, SLOT(slot_thisTime2(QVariant)));

    connect(mMainView, SIGNAL(sg_clkStopBtn2()), timer2, SLOT(stop()));
    connect(mMainView, SIGNAL(sg_clkResetBtn2()), timer2, SLOT(slot_resetTimer()));
}



