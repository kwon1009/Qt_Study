#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QTimer>
#include <QVector>
#include <QQuickWindow>
#include "MyThread.h"

class MainWindow : public QObject {
    Q_OBJECT

public:
    MainWindow();

    void setWindow(QQuickWindow* Widnow);
    void setConnection();

    Q_INVOKABLE QVariant getStr();
    Q_INVOKABLE void on_pushButton_timer_clicked();
    Q_INVOKABLE void on_pushButton_clicked();
    Q_INVOKABLE void on_pushButton_thread_clicked();

private slots:
    void on_timer_count();
    void on_thread_finish(const int value);
    void show();

signals:
    void sg_setText();

private:
    QVariant qstr;
    QTimer* m_timer;
    MyThread* m_thread;

    QQuickWindow* mMainView;
};

#endif // MAINWINDOW_H
