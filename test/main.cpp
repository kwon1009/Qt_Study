#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QObject>
#include <QDebug>
#include <QQuickItem>
#include <QQmlProperty>

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

    QObject *root = engine.rootObjects()[0];            // qrc:/main.qml를 등록한 엔진의 object값을 가져옴
//    QQuickItem *item = qobject_cast<QQuickWindow *>(root);
    QObject *rect = root->findChild<QObject*>("rect");  // objectName을 통해 객체를 받아옴
    rect->setProperty("color", "yellow");

    // 화면 연결
//    QQuickView view;
//    view.setSource(QUrl::fromLocalFile("test.qml"));
//    view.show();
//    QObject* object;
//    object = view.rootObject();
//    object->setProperty("width", 500);
//    QQmlProperty(object, "height").write(500);
//    QObject* rect = object->findChild<QObject*>("rect");
//    rect->setProperty("color", "blue");

//    delete object;
    return app.exec();
}
