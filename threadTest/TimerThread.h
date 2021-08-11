#ifndef TIMERTHREAD_H
#define TIMERTHREAD_H

#include <QObject>
#include <QThread>
#include <QVariant>

class TimerThread : public QThread
{
    Q_OBJECT

    int time;
    QString thisTime;

    void run() override;

public:
    TimerThread();
    ~TimerThread();

//    void slot_checkTime();
//    void slot_stopTime();

signals:
    void sg_tictok(QVariant time);
};

#endif // TIMERTHREAD_H
