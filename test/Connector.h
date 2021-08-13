#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QVector>
#include <QQuickWindow>
#include <QQmlApplicationEngine>

#include "MoveBox.h"

const int BOX_NUMBER = 5;
const QStringList OBJECT_NAMES = {"rec1Race", "rec2Race", "rec3Race", "rec4Race", "rec5Race"};
const QStringList REC_NAMES = {"A", "B", "C", "D", "E"};
const QStringList REC_COLORS = {"#FF8A65", "#64B5F6", "#FFF59D", "#B2FF59", "#B388FF"};

class Connector : public QObject {
    Q_OBJECT

private:
    QQmlApplicationEngine* mEngine;
    QQuickWindow* mMainView;

    QVector<MoveBox*> mMoveBoxs;
    QStringList mBoxRank;

    void setObjects();
    void setConnection();

public:
    Connector();
    ~Connector();

    // setting engine and windows connections
    void setEngine(QQmlApplicationEngine* engine);

    // qml onCompleted
    Q_INVOKABLE QVariant getObjNames();
    Q_INVOKABLE QVariant getNames();
    Q_INVOKABLE QVariant getColors();

signals:
    void sg_winner(QVariant names);

public slots:
    void slot_finish(QString name);
    void testSpace();
};

#endif // CONNECTOR_H
