#ifndef MYTHREAD_H
#define MYTHREAD_H

#include <QThread>

class MyThread : public QThread {
    Q_OBJECT
public:
    explicit MyThread(QObject *parent = 0);

private:
    // override
    void run();

signals:
    void FinishCount(const int value);

public slots:
};

#endif // MYTHREAD_H
