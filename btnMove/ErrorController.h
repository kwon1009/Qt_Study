#ifndef ERRORCONTROLLER_H
#define ERRORCONTROLLER_H

#include <QObject>
#include <QQuickView>
#include <QString>

enum errors { SETTING, JSON_WRITE_OPEN, JSON_READ_OPEN };

class ErrorController : public QObject {
    Q_OBJECT

public:
    void getError(errors err);

signals:
    void sg_printError(QVariant err);
};

#endif // ERRORCONTROLLER_H
