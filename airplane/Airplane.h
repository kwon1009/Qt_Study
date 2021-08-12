#ifndef AIRPLANE_H
#define AIRPLANE_H

#include <QObject>
#include <QVariant>

class Airplane : public QObject {
    Q_OBJECT

    QObject* mAirplaneView;
    QObject* mAirplane;
    void setObjects();
    void setObjects(int num);
    void setConnection();

    int mFinish = 640;
    int mFailBottom = 480;
    int mFailTop = 0;
    double mX = 0;
    double mY = 0;

    void checkXY();

public:
    Airplane(QObject* airplaneView);
    Airplane(QObject* airplaneView, int number);

signals:
    void sg_setXY(QVariant x, QVariant y);
    void sg_finish();

public slots:
    void slot_move();
    void slot_jump();
    void test();
};

#endif // AIRPLANE_H
