#include "Connector.h"

Connector::Connector()
{
    qmlRegisterType<Connector>("Connector", 1, 0, "Connector");
    timer1 = new MyTimer();
    timer2 = new MyTimer();
}

Connector::~Connector() {}

void Connector::setEngine(QQmlApplicationEngine* engine) {
    mEngine = engine;
    setWindow();
    setConnection();
}

void Connector::setWindow()
{
    // mainView
    QObject *root = mEngine->rootObjects()[0];
    mMainView = qobject_cast<QQuickWindow *>(root);

    // qmlTimer1
    QObject *t1 = root->findChild<QObject*>("timer1");
    if(!t1) {
        qDebug() << "Connector: qml timer1 is not exist.";
    } else {
        qmlTimer1 = t1;
        qDebug() << "Connector: qmlTimer1 saved.";
    }

    // qmlTimer2
    QObject *t2 = root->findChild<QObject*>("timer2");
    if(!t2) {
        qDebug() << "Connector: qml timer2 is not exist.";
    } else {
        qmlTimer2 = t2;
        qDebug() << "Connector: qmlTimer2 saved.";
    }
}

void Connector::setConnection()
{
    // timer1
    connect(qmlTimer1, SIGNAL(sg_clkStartBtn()), timer1, SLOT(slot_startTimer()));
    connect(timer1, SIGNAL(timeout()), timer1, SLOT(slot_setTime()));
    connect(timer1, SIGNAL(sg_thisTime(QVariant)), qmlTimer1, SLOT(slot_thisTime(QVariant)));

    connect(qmlTimer1, SIGNAL(sg_clkStopBtn()), timer1, SLOT(stop()));
    connect(qmlTimer1, SIGNAL(sg_clkResetBtn()), timer1, SLOT(slot_resetTimer()));

    connect(qmlTimer1, SIGNAL(sg_clkSaveBtn()), timer1, SLOT(slot_saveTime()));
    connect(timer1, SIGNAL(sg_showSaveTime(QVariant)), qmlTimer1, SLOT(slot_showSaveTime(QVariant)));

    connect(qmlTimer1, SIGNAL(sg_clkDelBtn()), timer1, SLOT(slot_deleteTime()));

    // timer2
    connect(qmlTimer2, SIGNAL(sg_clkStartBtn()), timer2, SLOT(slot_startTimer()));
    connect(timer2, SIGNAL(timeout()), timer2, SLOT(slot_setTime()));
    connect(timer2, SIGNAL(sg_thisTime(QVariant)), qmlTimer2, SLOT(slot_thisTime(QVariant)));

    connect(qmlTimer2, SIGNAL(sg_clkStopBtn()), timer2, SLOT(stop()));
    connect(qmlTimer2, SIGNAL(sg_clkResetBtn()), timer2, SLOT(slot_resetTimer()));

    connect(qmlTimer2, SIGNAL(sg_clkSaveBtn()), timer2, SLOT(slot_saveTime()));
    connect(timer2, SIGNAL(sg_showSaveTime(QVariant)), qmlTimer2, SLOT(slot_showSaveTime(QVariant)));

    connect(qmlTimer2, SIGNAL(sg_clkDelBtn()), timer2, SLOT(slot_deleteTime()));
}



