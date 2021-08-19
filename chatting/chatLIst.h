#ifndef CHATLIST_H
#define CHATLIST_H

#include <QObject>
#include <QVector>

class ChatList : public QObject {
    Q_OBJECT

    QObject* mChatListView;
    QVector<QStringList> mChatList;

public:
    ChatList();
    ~ChatList();
    void setConnections(QObject* view);

private slots:
    void slot_setChatList();
};

#endif // CHATLIST_H
