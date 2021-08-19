#include "chatList.h"
#include <QDebug>

ChatList::ChatList() {
    qDebug() << "ChatList: ChatList class setting completed.";
    qDebug() << "Login이 완료되었습니다.";
}

ChatList::~ChatList() {
    qDebug() << "Logout이 완료되었습니다.";
}

void ChatList::setConnections(QObject* view) {
    mChatListView = view;
    qDebug() << "ChatList: ChatList connections setting completed.";
}

void ChatList::slot_setChatList() {
    // setting chattinglist
    for(int i=0; i<10; i++) {
        mChatList.push_front({"./src/Happy dog.jpg", "어니부기", "Hello. Qt Coading.", "2021.08.19"});
    }
    qDebug() << "ChatList: chatting list loading completed.";
}
