#ifndef MOVEBOX_H
#define MOVEBOX_H

#include <QThread>
#include <QVariant>
#include <QRandomGenerator>

class MoveBox : public QThread {
    Q_OBJECT

    QObject* mRecRace;
    void setConnection();

    int mFinish = 900;
    double mX = 0;
    double mY = 50;

    void checkXY();

public:
   MoveBox(QObject *recRace);
   ~MoveBox() override;

protected:
   void run() override;

signals:
    void sg_setXY(QVariant x, QVariant y);
    void sg_finish();

public slots:
    void slot_stop();
};

#endif // MOVEBOX_H
