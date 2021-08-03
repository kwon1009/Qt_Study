#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Connector.h"

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
    con->setConnection();

    return app.exec();
}
