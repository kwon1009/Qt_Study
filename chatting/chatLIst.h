#ifndef CHATLIST_H
#define CHATLIST_H

#include <QObject>

class ChatList : public QObject {
    Q_OBJECT

    QObject* mChatListView;

public:
    ChatList();
};

#endif // CHATLIST_H
