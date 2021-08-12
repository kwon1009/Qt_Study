#ifndef AIRPLANE_H
#define AIRPLANE_H

#include <QObject>
#include <QVariant>

class Airplane : public QObject {
    Q_OBJECT

    int mFinish = 640;
    int mFailBottom = 480;
    int mFailTop = 0;
    double mX = 0;
    double mY = 0;

public:
    Airplane();

signals:
    void sg_setXY(QVariant x, QVariant y);
    void sg_finish();

public slots:
    void slot_move();
    void slot_jump();
};

#endif // AIRPLANE_H
