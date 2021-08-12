#include "MyTimer.h"

#include <QDebug>

MyTimer::MyTimer() {
    mMiSec = 0;
    mMin = 0;
    mSec = 0;
}

MyTimer::~MyTimer() {}

void MyTimer::slot_startTimer() {
    start(10);
    if(mSec == 0 && mMin == 0) {
        emit sg_thisTime(QVariant("00:00"));
    }
}

void MyTimer::slot_setTime() {
    // 시간 계산
    mMiSec++;
    if(mMiSec == 100) {
        mSec++;
        mMiSec = 0;
    }
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
    thisTime.append(QString("%1").arg(mSec)).append(".");

    if(mMiSec < 10) {
        thisTime.append("0");
    }
    thisTime.append(QString("%1").arg(mMiSec));

    mThisTime = thisTime;
    qDebug() << "MyTimer.cpp: time is" << mThisTime;
    emit sg_thisTime(QVariant(mThisTime));
}

void MyTimer::slot_resetTimer() {
    // !!stop 상태인지 먼저 확인하고 리셋되도록 하기
    stop();
    mMin = 0;
    mSec = 0;

    emit sg_thisTime(QVariant("--:--.--"));
}

void MyTimer::slot_saveTime() {
    if(mSaveTime.size() >= 5) {
        mSaveTime.pop_front();
    }
    mSaveTime.push_back(mThisTime);
    qDebug() << "MyTimer.cpp: save Time.";
    emit sg_showSaveTime(QVariant(mSaveTime));
}

void MyTimer::slot_deleteTime() {
    while(!mSaveTime.empty()) {
        mSaveTime.pop_front();
    }
    qDebug() << "MyTimer.cp: delete Time.";
    emit sg_showSaveTime(QVariant(mSaveTime));
}
