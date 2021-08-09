#include "ErrorController.h"

void ErrorController::getError(QString err) {
    QVariant errText = err;
    qDebug() << "ErroController:" << errText;
    emit sg_printError(errText);
}
