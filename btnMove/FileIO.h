#ifndef FILEIO_H
#define FILEIO_H

#include <QFile>
#include <QVector>
#include <QMap>
#include <QVariant>

const QString mFileRoot = "./";

class FileIO {

    QString mFileName;

public:
    FileIO(QString filename);
    QVector<QString> read();                // 파일 정보 불러오기
    void write(QVector<QString> contents);  // 파일 저장하기
};

#endif // FILEIO_H
