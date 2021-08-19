#include "connector.h"

void printObjectIsNotFound(QString objName) {
    qDebug() << QString("Connector: %1 is not exist.").arg(objName);
}

Connector::Connector(QQmlApplicationEngine* engine) {
    mEngine = engine;

    // mainView
    QObject *root = mEngine->rootObjects()[0];
    mMainWindow = qobject_cast<QQuickWindow *>(root);

    // first view : login view
    QObject* thisView = mMainWindow->findChild<QObject*>("loginView");
    if(!thisView) printObjectIsNotFound("loginView");
    else    mThisView = thisView;

    mChatList = new ChatList();
    connect(mThisView, SIGNAL(sg_setChatList()), mChatList, SLOT(slot_setChatList()));

    setConnections();
}

void Connector::setViews(QVariant viewName) {
    // set next view
    QString viewObj = viewName.toString().chopped(4);
    QObject* thisView = mMainWindow->findChild<QObject*>(viewObj);
    if(!thisView) printObjectIsNotFound(viewObj);
    else mThisView = thisView;
}

void Connector::setConnections() {
    // set connection for next view
    connect(mThisView, SIGNAL(getNextView(QVariant)), mMainWindow, SLOT(changeView(QVariant)));
    connect(mThisView, SIGNAL(getNextView(QVariant)), this, SLOT(setNextView(QVariant)));
}

void Connector::setNextView(QVariant nextView) {
    setViews(nextView);
    setConnections();
    qDebug() << "Connector: change view ->" << nextView.toString();

    // create class
    if(nextView == "loginView.qml") {
        // new login and loading chatting list
        delete mChatList;
        mChatList = new ChatList();
        connect(mThisView, SIGNAL(sg_setChatList()), mChatList, SLOT(slot_setChatList()));
    } else if(nextView == "chatListView.qml") {
        mChatList->setConnections(mThisView);
    }
}

// test code
void Connector::test() {
    qDebug() << "Connector: slot test";
}
