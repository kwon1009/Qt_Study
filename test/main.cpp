#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QThread>
#include <QDebug>
#include <QTimer>

#include "worker.h"
#include "MyThread.h"

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
    // thread sample 1
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

    // thread sample 2
    MyThread *thread2 = new MyThread;
    QObject::connect(thread2, &MyThread::finished, thread2, &QObject::deleteLater);

    // 스레드 시작
    thread2->start();

    QTimer::singleShot(10, &app, [thread2](){

        // 3초후에 스레드 중단을 요청.
        thread2->requestInterruption();
    });

    return app.exec();
}
