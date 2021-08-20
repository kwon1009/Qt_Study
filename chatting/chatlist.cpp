#include "chatList.h"
#include <QDebug>

ChatList::ChatList() {
    qDebug() << "ChatList: ChatList class setting completed.";
    mJSONController = new JSONController("chatlist.json");

    setChatList();
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
    ChatListStruct sChatList;
    QJsonArray jsonChatList = mJSONController->getJsonArray("chatlist");
    for(int i=0; i<jsonChatList.size(); i++) {
        QJsonObject chatObj = jsonChatList[i].toObject();
        sChatList.id = chatObj["id"].toInt();
        sChatList.profileImg = chatObj["profileImg"].toString();
        sChatList.profileName = chatObj["profileName"].toString();
        sChatList.lastContent = chatObj["lastContent"].toString();
        sChatList.lastTime = chatObj["lastTime"].toString();
        mChatList.append(sChatList);
    }
    qDebug() << "ChatList: chatting list loading completed.";
}

// qml onCompleted
QVariant ChatList::getChatList() {
    QVariantList chatList;
    for(int i=0; i<mChatList.size(); i++) {
        // string 형식으로 변경
        QStringList chatListString;
        chatListString.append(mChatList[i].profileImg);
        chatListString.append(mChatList[i].profileName);
        chatListString.append(mChatList[i].lastContent);
        chatListString.append(mChatList[i].lastTime);
        chatList.append(chatListString);
    }

    qDebug() << "ChatList: get chatting list";
    return QVariant(chatList);
}

void ChatList::slot_test() {
    qDebug() <<"test";
}
