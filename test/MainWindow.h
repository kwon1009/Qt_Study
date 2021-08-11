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
//    ~MainWindow();

    void setWindow(QQuickWindow* Widnow);

    Q_INVOKABLE QVariant getStr();

//private slots:
//    void on_pushButton_clicked();
//    void on_pushButton_timer_clicked();
//    void on_timer_count();
//    void on_pushButton_thread_clicked();
//    void on_thread_finish(const int value);

private:
    QVariant qstr;
    QTimer* m_timer;
    MyThread* m_thread;

    QQuickWindow* mMainView;
};

#endif // MAINWINDOW_H
