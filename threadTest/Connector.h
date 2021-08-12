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
    MyTimer* timer2;

public:
    Connector();
    ~Connector();

    void setWindow(QQuickWindow* Widnow);
    void setConnection();
};

#endif // CONNECTOR_H
