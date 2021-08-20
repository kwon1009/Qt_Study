#ifndef CHATLIST_H
#define CHATLIST_H

#include <QObject>
#include <QQmlEngine>
#include <QVector>
#include <QVariant>

#include <QJsonObject>
#include <QJsonArray>
#include "jsoncontroller.h"

struct ChatListStruct {
    int id;
    QString profileImg;
    QString profileName;
    QString lastContent;
    QString lastTime;
};

class ChatList : public QObject {
    Q_OBJECT

    JSONController* mJSONController;

    QObject* mChatListView;
    QVector<ChatListStruct> mChatList;
    QString str1;       // test code

public:
    ChatList();
    ~ChatList();
    void setConnections(QObject* view);

    // qml onCompleted
    Q_INVOKABLE void setChatList();
    Q_INVOKABLE QVariant getChatList();

private slots:
    void slot_test();
};

#endif // CHATLIST_H
