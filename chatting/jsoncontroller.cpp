#include "jsoncontroller.h"

#include <QDebug>

JSONController::JSONController(QString filename) {
    mFilePath = mJsonFileRoot + filename;
    if(QFile::exists(mFilePath) == false) {
        qDebug() << "JSONController:" << filename << "is not exists.";
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
    qDebug() << "JSONController: file open complete.";
}

void JSONController::read() {
    open(false);
    for(int i=0; i<cnstTitles.size(); i++) {
        QString title = cnstTitles[i];
        jsonTitles[title] = doc.object()[title].toArray();
    }
    file.close();
    qDebug() << "JSONController: file read complete.";
}

void JSONController::write(QJsonObject contents) {
    open(true);
    doc.setObject(contents);
    file.write(doc.toJson());
    file.close();
    qDebug() << "JSONController: file write complete.";
}

// !!현재 read에서 array 형식으로 받아오고 있음
QJsonObject JSONController::getJsonObj(QString title) {
    return jsonTitles[title].toObject();
}

QJsonArray JSONController::getJsonArray(QString title) {
    return jsonTitles[title].toArray();
}

void JSONController::setJsonObj(QString title, QJsonObject contents) {
    jsonTitles[title] = contents;
}
