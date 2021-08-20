#ifndef JSONCONTROLLER_H
#define JSONCONTROLLER_H

#include <QFile>
#include <QIODevice>
#include <QJsonDocument>
#include <QJsonObject>

const QString mJsonFileRoot = "./";
const QStringList cnstTitles = { "chatlist" };

class JSONController {

    QString mFilePath;

    QFile file;

    QJsonDocument doc;
    QJsonObject jsonTitles;

public:
    JSONController(QString filename);
    void open(const bool is_write);
    void read();                        // 파일 정보 불러오기
    void write(QJsonObject contents);   // 파일 저장하기
        // !!수정 사항만 적용 또는 전체 적용

    // 원하는 설정 정보 관리
    QJsonObject getJsonObj(QString title);
    void setJsonObj(QString title, QJsonObject contents);
};


#endif // JSONCONTROLLER_H
