#ifndef CHATLIST_H
#define CHATLIST_H

#include <QObject>
#include <QQmlEngine>
#include <QVector>
#include <QVariant>

class ChatList : public QObject {
    Q_OBJECT

    QObject* mChatListView;
    QVector<QStringList> mChatList;
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
