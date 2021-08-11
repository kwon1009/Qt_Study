#include "worker.h"

#include <QDebug>

Worker::Worker(QObject *parent) : QObject(parent)
{

}

Worker::~Worker()
{
    qDebug() << Q_FUNC_INFO;
}

void Worker::doWork(const QString &meter) {
    QString result("hello");

    // 여기서 오래걸리는 작업을 수행
    int high_count = 0;
    int low_count;

    while(high_count < 10000) {
        high_count++;
        low_count = 0;
        while(low_count < 10000)
            low_count++;
    }

    emit resultReady(result + meter + QString("%1").arg(high_count));
}
