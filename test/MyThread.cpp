#include "MyThread.h"
#include <QDebug>

MyThread::MyThread()
{

}

MyThread::~MyThread()
{
    qDebug() << Q_FUNC_INFO;
}

void MyThread::run()
{
    forever{ // for(;;)와 동일. 무한 루프를 작성하는 데 편의를 제공하는 매크로.

        // 여기서 오래걸리는 코드를 실행
        int high_count = 0;
        int low_count;

        while(high_count < 10000) {
            high_count++;
            low_count = 0;
            while(low_count < 10000)
                low_count++;
        }

        // 스레드에서 실행 중인 작업을 중지해야 하는 경우 true가 반환됨. 중단은 requestInterruption() 함수로 요청할 수 있다.
        if ( QThread::currentThread()->isInterruptionRequested() ) {
            qDebug() << Q_FUNC_INFO << " terminated";
            return;
        }
    }
}
