#ifndef JSONCONTROLLER_H
#define JSONCONTROLLER_H

#include <QFile>
#include <QIODevice>
#include <QJsonDocument>
#include <QJsonObject>


class JSONController {

    QStringList mSetTitles;    // 읽어올 설정 정보 목록
    QString mFilePath;

    QFile file;
    QJsonDocument doc;
    QJsonObject jsonTitles;

public:
    JSONController(QStringList setTitles, QString filename);
    ~JSONController();

    bool open(const bool is_write);
    void read();                        // 파일 정보 불러오기
    void write(QJsonObject contents);   // 파일 저장하기

    // 원하는 설정 정보 관리
    QJsonObject getJsonObj(QString title);
    void setJsonObj(QString title, QJsonObject contents);
};

#endif // JSONCONTROLLER_H
