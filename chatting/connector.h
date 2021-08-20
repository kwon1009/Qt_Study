#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QVariant>

#include "chatList.h"

class Connector : public QObject {
    Q_OBJECT

    QQmlApplicationEngine* mEngine;
    QQuickWindow* mMainWindow;
    QObject* mThisView;

//    ChatList* mChatList;

    void setViews(QVariant viewName);
    void setConnections();

public:
    Connector(QQmlApplicationEngine* engine);

private slots:
    void setNextView(QVariant nextView);
    void test();    // test code
};

#endif // CONNECTOR_H
