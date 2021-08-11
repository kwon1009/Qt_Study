#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "MainWindow.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    MainWindow* main = new MainWindow();

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
//    main->setWindow(qobject_cast<QQuickWindow *>(root)); // qrc:/main.qml를 등록한 엔진의 object값을 window타입으로 변경해준다.
//    main->setConnection();

    QObject::connect(main, SIGNAL(sg_setText()), main, SLOT(show()));

    return app.exec();
}
