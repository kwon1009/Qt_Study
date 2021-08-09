#include "JSONController.h"

#include <QDebug>

JSONController::JSONController(QString filename) {
    mFilePath = mJsonFileRoot + filename;
    if(QFile::exists(mFilePath) == false) {
        qDebug() << "Setting file is not exists.";
    }
    read();
}

void JSONController::open(const bool is_write) {
    file.setFileName(mFilePath);
    if(is_write) {
        if(!file.open(QIODevice::WriteOnly)) {
            qDebug() << "Could not open file for write";
        }
    }
    else {
        if(!file.open(QIODevice::ReadWrite)) {
            qDebug() << "Could not open file for read";
        }
    }
    QByteArray loadData = file.readAll();
    doc = QJsonDocument::fromJson(loadData);
}

void JSONController::read() {
    open(false);
    for(int i=0; i<cnstTitles.size(); i++) {
        QString title = cnstTitles[i];
        jsonTitles[title] = doc.object()[title].toObject();
    }
    file.close();
}

void JSONController::write(QJsonObject contents) {
    open(true);
    doc.setObject(contents);
    file.write(doc.toJson());
    file.close();
}

QJsonObject JSONController::getJsonObj(QString title) {
    read();
    return jsonTitles[title].toObject();
}

void JSONController::setJsonObj(QString title, QJsonObject contents) {
    jsonTitles[title] = contents;
}
