#include "MyTimer.h"
#include <QDebug>

MyTimer::MyTimer() {
    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(slot_timer()));
    timer->start(1000);
}

void MyTimer::slot_timer() {
    qDebug() << "tic tok";
}
