#include "MainWindow.h"

MainWindow::MainWindow() {
    qmlRegisterType<MainWindow>("MainWindow", 1, 0, "MainWindow");

//    m_timer = new QTimer;
//    connect(m_timer, SIGNAL(timeout()), this, SLOT(on_timer_count()));
//    m_thread = new MyThread(this);
//    connect(m_thread, SIGNAL(FinishCount(int)), this, SLOT(on_thread_finish(int)));
}

void MainWindow::setWindow(QQuickWindow* Window)
{
    mMainView = Window;
}

QVariant MainWindow::getStr() {
    qstr = "test";
    return qstr;
}

//void MainWindow::on_pushButton_timer_clicked() {
//    m_timer->start(100);
//}

//void MainWindow::on_pushButton_clicked() {
//    static int count=0;
//    QString qstr;
//    qstr = QString("%1 %2 %3...").arg(count).arg(count+1).arg(count+2);
////    ui->lineEdit->setText(qstr);
//    count++;
//}

//void MainWindow::on_timer_count() {
//    static int count = 0;
//    static QVector<int> integers;
//    integers.push_back(count);

//    QString qstr;
//    qstr = QString("%1 %2 %3").arg(integers[0]).arg(integers.last()).arg(integers.size());
//    // ui->lineEdit->setText(qstr);

//    count++;
//    if(count == 100) {
//        count = 0;
//        integers.clear();
//        m_timer->stop();
//    }
//}

//void MainWindow::on_pushButton_thread_clicked(){
//    m_thread->start();
//}

//void MainWindow::on_thread_finish(const int value) {
//    if(m_thread->isFinished() == false)
//        return;
//    if(m_thread->isRunning() == true)
//        return;

////    QString qstr;
//    qstr = QString("high_count=%1").arg(value);
//    // ui->lineEdit->setText(qstr);
//}

