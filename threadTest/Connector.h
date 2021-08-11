#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QQuickWindow>
#include <QTimer>
#include <QVariant>

#include "MyTimer.h"

#include "TimerThread.h"

class Connector : public QObject {
    Q_OBJECT

private:
    QQuickWindow* mMainView;
    MyTimer* timer1;

    TimerThread* timerThread;
    QTimer* timer;
    int time;

public:
    Connector();
    ~Connector();

    void setWindow(QQuickWindow* Widnow);
    void setConnection();

signals:
    void sg_tictok(QVariant time);

public slots:
    void slot_startTimer();
    void slot_stopTimer();
    void tictok();

};

#endif // CONNECTOR_H
