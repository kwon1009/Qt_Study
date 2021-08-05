#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QQuickWindow>
#include <QDir>
#include <iostream>
using namespace std;

class Connector : public QObject {
    Q_OBJECT

public:
    Connector();
    ~Connector();

    // overriding
    void setWindow(QQuickWindow* Widnow);

    void setConnection();

private:
    QQuickWindow* mMainView;

signals:
    void sg_photos(QVariant photos);

private slots:
    void slot_setPhotos();
};

#endif // CONNECTOR_H
