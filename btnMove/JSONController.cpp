#include "JSONController.h"

#include <QDebug>
#include <QDir>
#include "ErrorController.h"

// function: 새로운 설정 파일 생성
void makeSettingFile(QString filename) {
    QFile file;
    file.setFileName("../settings.json");
    file.open(QIODevice::WriteOnly);    // 새로운 설정 파일 생성

    // 저장할 JSON obj
    QJsonObject settings;

    // Data default Root Path
    QString imgPath = "../src/";

    QJsonObject path;
    path["img"] = imgPath;
    settings["path"] = path;

    // src 폴더에 존재하는 이미지 목록 가져오기
    QVector<QString> imgList;
    QDir directory(imgPath);
    QStringList images = directory.entryList(QStringList() << "*", QDir::Files);

    // 이미지 정보 저장
    QJsonObject btnList;
    for(int i=0; i<images.size(); i++) {
        btnList[QString("%1").arg(i)] = images[i];
    }
    qDebug() << btnList;
    settings["btns"] = btnList;

    // json 파일로 저장
    QByteArray loadData = file.readAll();
    QJsonDocument doc;
    doc = QJsonDocument::fromJson(loadData);
    doc.setObject(settings);
    file.write(doc.toJson());
    file.close();
}

JSONController::JSONController(QStringList setTitles, QString filename) {
    mSetTitles = setTitles;
    mFilePath = filename;
    if(QFile::exists(mFilePath) == false) {
        qDebug() << "JSONController: Setting file is not exists.";
        qDebug() << "JSONController: Making new setting file.";

        makeSettingFile(filename);  // 새로운 setting.json 파일 생성
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
            throw JSON_WRITE_OPEN;
        }
    }
    else {
        if(!file.open(QIODevice::ReadWrite)) {
            qDebug() << "JSONController: Could not open file for read";
            throw JSON_READ_OPEN;
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
