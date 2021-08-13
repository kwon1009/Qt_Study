#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QQuickWindow>
#include <QQmlApplicationEngine>

class Connector : public QObject {
    Q_OBJECT

private:
    QQmlApplicationEngine* mEngine;
    QQuickWindow* mMainWindow;

    void setObjects();
    void setConnector();

public:
    void setEngine(QQmlApplicationEngine* engine);
};

#endif // CONNECTOR_H
