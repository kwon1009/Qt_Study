#ifndef MYTIMER_H
#define MYTIMER_H

#include <QTimer>
#include <QVariant>
#include <QVector>

class MyTimer : public QTimer {
    Q_OBJECT

    int mMin;
    int mSec;
    int mMiSec;
    QString mThisTime;

    int mMaxSave = 5;
    QStringList mSaveTime;

public:
    MyTimer();
    ~MyTimer();

public slots:
    void slot_startTimer();
    void slot_setTime();
    void slot_resetTimer();
    void slot_saveTime();
    void slot_deleteTime();

signals:
    void sg_thisTime(QVariant);
    void sg_showSaveTime(QVariant);
};

#endif // MYTIMER_H
