#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>

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
    QObject *root = engine.rootObjects()[0];
    con->setWindow(qobject_cast<QQuickWindow *>(root));
    con->setConnection();

    return app.exec();
}
