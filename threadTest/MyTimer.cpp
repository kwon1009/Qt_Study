#include "MyTimer.h"

#include <QDebug>

MyTimer::MyTimer() {
    mMin = 0;
    mSec = 0;
}

MyTimer::~MyTimer() {}

void MyTimer::slot_startTimer() {
    start(1000);
    if(mSec == 0 && mMin == 0) {
        emit sg_thisTime(QVariant("00:00"));
    }
}

void MyTimer::slot_setTime() {
    // 시간 계산
    mSec++;
    if(mSec == 60) {
        mMin++;
        mSec = 0;
    }

    // 보낼 시간
    QString thisTime = "";
    if(mMin < 10) {
        thisTime.append("0");
    }
    thisTime.append(QString("%1").arg(mMin)).append(":");

    if(mSec < 10) {
        thisTime.append("0");
    }
    thisTime.append(QString("%1").arg(mSec));
    qDebug() << "time is" << thisTime;

    emit sg_thisTime(QVariant(thisTime));
}

void MyTimer::slot_resetTimer() {
    // !!stop 상태인지 먼저 확인하고 리셋되도록 하기
    stop();
    mMin = 0;
    mSec = 0;

    emit sg_thisTime(QVariant("--:--"));
}
