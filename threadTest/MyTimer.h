#ifndef MYTIMER_H
#define MYTIMER_H

#include <QTimer>
#include <QVariant>

class MyTimer : public QTimer {
    Q_OBJECT

    int mMin;
    int mSec;

public:
    MyTimer();
    ~MyTimer();

public slots:
    void slot_startTimer();
    void slot_setTime();
    void slot_resetTimer();

signals:
    void sg_thisTime(QVariant);
};

#endif // MYTIMER_H
