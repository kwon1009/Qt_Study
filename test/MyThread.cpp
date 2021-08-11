#include "MyThread.h"

MyThread::MyThread(QObject* parent) : QThread(parent)
{}

void MyThread::run() {
    int high_count = 0;
    int low_count;

    while(high_count < 10000) {
        high_count++;
        low_count = 0;
        while(low_count < 10000)
            low_count++;
    }

    emit FinishCount(high_count);
}
