#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QVariant>

class Connector : public QObject {
    Q_OBJECT

    QQmlApplicationEngine* mEngine;
    QQuickWindow* mMainWindow;
    QObject* mThisView;

    void setViews();
    void setConnections();

public:
    Connector(QQmlApplicationEngine* engine);

private slots:
    void setNextView(QVariant testStr);
    void test();    // test code
};

#endif // CONNECTOR_H
