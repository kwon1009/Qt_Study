#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QQuickWindow>
#include <QQmlApplicationEngine>

#include "MoveBox.h"
//#include "MyTimer.h"

class Connector : public QObject {
    Q_OBJECT

private:
    QQmlApplicationEngine* mEngine;
    QQuickWindow* mMainView;

    MoveBox* mMoveBox1;
    MoveBox* mMoveBox2;
//    MyTimer* timer;

    void setObjects();
    void setConnection();

public:
    Connector();
    ~Connector();

    // setting engine and windows connections
    void setEngine(QQmlApplicationEngine* engine);
};

#endif // CONNECTOR_H
