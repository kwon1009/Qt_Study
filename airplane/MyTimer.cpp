
#include "MyTimer.h"

#include <QDebug>

MyTimer::MyTimer() {

}

void MyTimer::slot_start() {
    qDebug() << "MyTimer: timer start";
    start(1);
}

void MyTimer::slot_finish() {
    stop();
}
