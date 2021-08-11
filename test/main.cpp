#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QThread>
#include <QDebug>

#include "worker.h"

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

    // thread 구현
    QThread thread;

    Worker *worker = new Worker;
    worker->moveToThread(&thread);
    thread.start();

    QObject::connect(worker, &Worker::start, worker, &Worker::doWork);
    QObject::connect(&thread, &QThread::finished, worker, &QObject::deleteLater);

    QObject::connect(worker, &Worker::resultReady, [&](const QString &result){
        qDebug() << result;
        thread.quit(); // 스레드중지
    });

    emit worker->start("World");

    return app.exec();
}
