#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Connector.h"

#include <QDebug>
#include <QQuickView>
#include <QQmlComponent>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    Connector* con = new Connector();   // Connect Class

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    // Connector setWindow
    QObject *root = engine.rootObjects()[0];            // qrc:/main.qml를 등록한 엔진의 object값을 가져옴
    con->setWindow(qobject_cast<QQuickWindow *>(root)); // qrc:/main.qml를 등록한 엔진의 object값을 window타입으로 변경해준다.

    // ObjectName 받아오기
    QObject *item = root->findChild<QObject*>("secondView");
    if(!item) qDebug() << "찾는 정보가 없습니다.";
    else con->secondView = item;

//    QQmlEngine en;
//    QQmlComponent component(&en, "photoAni.qml");
//    QObject *object = component.create();
//    delete object;

//    QQmlComponent component()
//    QQuickView view(QUrl::fromLocalFile("photoAni.qml"));
//    QObject *item = view.findChild<QObject*>("secondView");
//    con->secondView = item;


    con->setConnection();

    return app.exec();
}
