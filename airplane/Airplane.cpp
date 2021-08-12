#include "Airplane.h"

#include <QDebug>

Airplane::Airplane(QObject* airplaneView) {
    mAirplaneView = airplaneView;
    setObjects();
    setConnection();
}

Airplane::Airplane(QObject* airplaneView, int num) {
    mAirplaneView = airplaneView;
    setObjects(num);
    setConnection();
}

void Airplane::setObjects() {
    QObject* airplane = mAirplaneView->findChild<QObject*>("airplane");
    if(!airplane) {
        qDebug() << "Airplane: airplane obj is not exist";
    } else {
        mAirplane = airplane;

        mAirplane->setProperty("color", "Violet");
    }
}

void Airplane::setObjects(int num) {
    QString objName = QString("airplane%1").arg(num);
    QObject* airplane = mAirplaneView->findChild<QObject*>(objName);
    if(!airplane) {
        qDebug() << "Airplane: airplane obj is not exist";
    } else {
        mAirplane = airplane;

        mAirplane->setProperty("color", "Violet");
    }
}

void Airplane::setConnection() {
    connect(this, SIGNAL(sg_setXY(QVariant, QVariant)), mAirplaneView, SLOT(slot_setXY(QVariant, QVariant)));
    connect(mAirplaneView, SIGNAL(sg_pressEnter()), this, SLOT(test()));
    connect(mAirplaneView, SIGNAL(sg_pressSpace()), this, SLOT(slot_jump()));
}

void Airplane::test() {
    qDebug() << "test";
}

void Airplane::checkXY() {
    if(mX >= mFinish) {
        qDebug() << "Airplane: Finish";
        emit sg_finish();
    } else if (mY >= mFailBottom || mY < mFailTop) {
        qDebug() << "Airplane: Fail";
        emit sg_finish();
    } else {
        emit sg_setXY(QVariant(mX), QVariant(mY));
    }
}

void Airplane::slot_move() {
    mX += 0.5;
    mY += 0.8;
    checkXY();
}

void Airplane::slot_jump() {
    qDebug() << "Airplane: Jump";
    mX += 5;
    mY -= 20;
    checkXY();
}
