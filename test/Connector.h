#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QQuickWindow>
#include <QQmlApplicationEngine>

#include "MoveBox.h"

class Connector : public QObject {
    Q_OBJECT

private:
    QQmlApplicationEngine* mEngine;
    QQuickWindow* mMainView;

    MoveBox* mMoveBox1;
    MoveBox* mMoveBox2;

    QStringList mBoxRank;
    int mBoxNum = 2;

    void setObjects();
    void setConnection();

public:
    Connector();
    ~Connector();

    // setting engine and windows connections
    void setEngine(QQmlApplicationEngine* engine);

signals:
    void sg_winner(QVariant names);

public slots:
    void slot_finish(QString name);
};

#endif // CONNECTOR_H
