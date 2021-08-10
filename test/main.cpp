#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QObject>
#include <QDebug>
#include <QQuickItem>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    // 화면 연결
    QQuickView view;
    view.setSource(QUrl::fromLocalFile("test.qml"));
    view.show();
    QObject* object;
    object = view.rootObject();

    delete object;
    return app.exec();
}
