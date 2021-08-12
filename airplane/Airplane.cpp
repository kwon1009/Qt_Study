#include "Airplane.h"

#include <QDebug>

Airplane::Airplane() {

}

void Airplane::slot_move() {
    mX += 0.5;
    mY += 0.8;

    if(mX >= mFinish || mY >= mFailBottom) {
        qDebug() << "Airplane: Finish";
        emit sg_finish();
    } else {
        emit sg_setXY(QVariant(mX), QVariant(mY));
    }
}

void Airplane::slot_jump() {
    qDebug() << "Airplane: Jump";
}
