#ifndef MOVEBOX_H
#define MOVEBOX_H

#include <QThread>
#include <QVariant>
#include <QRandomGenerator>

class MoveBox : public QThread {
    Q_OBJECT

    QObject* mRecRace;
    QString mName;
    void setConnection();

    int mFinish = 950;
    double mX = 0;
    double mY = 15;

    void checkXY();

public:
   MoveBox(QObject *recRace, QString name);
   ~MoveBox() override;

protected:
   void run() override;

signals:
    void sg_setXY(QVariant x, QVariant y);
    void sg_finish(QString name);

public slots:
    void slot_stop(QString name);
};

#endif // MOVEBOX_H
