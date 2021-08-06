#ifndef JSONCONTROLLER_H
#define JSONCONTROLLER_H

#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>

const QString mJsonFileRoot = "./";
const QStringList cnstTitles = { "btns" };

class JSONController {

    QString mFilePath;

    QFile file;

    QJsonDocument doc;
    QJsonObject jsonTitles;

public:
    JSONController(QString filename);
    void open(const bool is_write);
    void read();                // 파일 정보 불러오기
    void write(QJsonObject contents);  // 파일 저장하기
        // !!수정 사항만 적용 또는 전체 적용
    QJsonObject getJsonObj(QString title);
};

#endif // JSONCONTROLLER_H
