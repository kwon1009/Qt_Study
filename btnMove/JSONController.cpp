#include "JSONController.h"

#include <QDebug>

JSONController::JSONController(QStringList setTitles, QString filename) {
    mSetTitles = setTitles;
    mFilePath = filename;
    if(QFile::exists(mFilePath) == false) {
        qDebug() << "JSONController: Setting file is not exists.";
    }
    read();
}

JSONController::~JSONController() {
    write(jsonTitles);  // 변경 사항들 한번에 적용
}

void JSONController::open(const bool is_write) {
    file.setFileName(mFilePath);
    if(is_write) {
        if(!file.open(QIODevice::WriteOnly)) {
            qDebug() << "JSONController: Could not open file for write";
        }
    }
    else {
        if(!file.open(QIODevice::ReadWrite)) {
            qDebug() << "JSONController: Could not open file for read";
        }
    }
    QByteArray loadData = file.readAll();
    doc = QJsonDocument::fromJson(loadData);
}

void JSONController::read() {
    open(false);
    for(int i=0; i<mSetTitles.size(); i++) {
        QString title = mSetTitles[i];
        jsonTitles[title] = doc.object()[title].toObject();
    }
    file.close();
    qDebug() << "JSONController: Setting file read complete.";
}

void JSONController::write(QJsonObject contents) {
    open(true);
    doc.setObject(contents);
    file.write(doc.toJson());
    file.close();
    qDebug() << "JSONController: Setting file write is complete.";
}

QJsonObject JSONController::getJsonObj(QString title) {
    qDebug() << "JSONController: Get" << title << "JSON object.";
    return jsonTitles[title].toObject();
}

void JSONController::setJsonObj(QString title, QJsonObject contents) {
    // 수정 사항만 적용
    // 프로그램 종료 시, 한번에 반영되도록 함
    jsonTitles[title] = contents;
    qDebug() << "JSONController: Set" << title << "to JSON object.";
}
