#ifndef MYTIMER_H
#define MYTIMER_H

#include <QTimer>

class MyTimer : public QTimer {
    Q_OBJECT

    int time;

public:
    MyTimer();
    ~MyTimer();
};

#endif // MYTIMER_H
