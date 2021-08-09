#ifndef ERRORCONTROLLER_H
#define ERRORCONTROLLER_H

#include <QObject>
#include <QQuickView>
#include <QString>

class ErrorController : public QObject {
    Q_OBJECT

public:
    void getError(QString err);

signals:
    void sg_printError(QVariant err);
};

#endif // ERRORCONTROLLER_H
