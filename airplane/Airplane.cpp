#include "Airplane.h"

#include <QDebug>

Airplane::Airplane() {

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
