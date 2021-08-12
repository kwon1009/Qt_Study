
#include "MyTimer.h"

MyTimer::MyTimer() {
    start(1);
}

void MyTimer::slot_finish() {
    stop();
}
