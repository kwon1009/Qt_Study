#include "chatList.h"
#include <QDebug>

ChatList::ChatList() {
    qmlRegisterType<ChatList>("ChatList", 1, 0, "ChatList");
    qDebug() << "ChatList: ChatList class setting completed.";
}

ChatList::~ChatList() {
    qDebug() << "Logout이 완료되었습니다.";
}

void ChatList::setConnections(QObject* view) {
    mChatListView = view;
    qDebug() << "ChatList: ChatList connections setting completed.";
}

void ChatList::setChatList() {
    // setting chattinglist
    for(int i=0; i<10; i++) {
        mChatList.append({"./src/Happy dog.jpg", "어니부기", "Hello. Qt Coading.", "2021.08.19"});
    }
    qDebug() << "ChatList: chatting list loading completed.";
}

// qml onCompleted
QVariant ChatList::getChatList() {
    setChatList();

    qDebug() << "ChatList: get chatting list";
    qDebug() << mChatList;

    QString str = "test";
    return QVariant(str);
}

void ChatList::slot_test() {
    qDebug() <<"test";
}
