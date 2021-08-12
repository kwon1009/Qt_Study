#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QQuickWindow>
#include <QTimer>
#include <QVariant>
#include <QQmlApplicationEngine>

#include "MyTimer.h"

#include "TimerThread.h"

class Connector : public QObject {
    Q_OBJECT

private:
    QQmlApplicationEngine* mEngine;
    QQuickWindow* mMainView;
    MyTimer* timer1;
    MyTimer* timer2;
    QObject* qmlTimer1;
    QObject* qmlTimer2;

    void setWindow();
    void setConnection();

public:
    Connector();
    ~Connector();

    // setting engine and windows connections
    void setEngine(QQmlApplicationEngine* engine);
};

#endif // CONNECTOR_H
