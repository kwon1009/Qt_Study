#include "ErrorController.h"

void ErrorController::getError(errors err) {
    QVariant errText;

    switch(err) {
    case SETTING:
        break;

    case JSON_WRITE_OPEN:
        errText = "Could not open file for write.";
        break;

    case JSON_READ_OPEN:
        errText = "Could not open file for read.";
        break;
    }

    emit sg_printError(errText);
}
