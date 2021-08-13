#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QVector>
#include <QQuickWindow>
#include <QQmlApplicationEngine>

#include "MoveBox.h"

const QStringList recRaces = {"rec1Race", "rec2Race", "rec3Race", "rec4Race", "rec5Race"};
const QStringList racNames = {"A", "B", "C", "D", "E"};

class Connector : public QObject {
    Q_OBJECT

private:
    QQmlApplicationEngine* mEngine;
    QQuickWindow* mMainView;

    QVector<MoveBox*> mMoveBoxs;
    QStringList mBoxRank;
    int mBoxNum = 5;

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
