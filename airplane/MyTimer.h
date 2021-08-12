#ifndef MYTIMER_H
#define MYTIMER_H

#include <QTimer>

class MyTimer : public QTimer
{
    Q_OBJECT

public:
    MyTimer();

public slots:
    void slot_finish();
};

#endif // MYTIMER_H
