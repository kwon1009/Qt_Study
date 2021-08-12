
#include "MyTimer.h"

MyTimer::MyTimer() {

}

void MyTimer::slot_start() {
    start(1);
}

void MyTimer::slot_finish() {
    stop();
}
