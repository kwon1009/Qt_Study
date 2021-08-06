#ifndef FILEIO_H
#define FILEIO_H

#include <QFile>
#include <QVector>
#include <QMap>
#include <QVariant>

class FileIO {

    QString mFileRoot = "./";
    QString mFileName;
    QVector<QString> mFileList;

    QMap<int, QString> mMatchings;

    void read();            // 저장된 이미지 정보 불러옴
    void write();           // save 버튼 클릭 시, 이미지 저장
    void setMatchings();

public:
    FileIO(QString filename);
    QMap<int, QString> getMatchings();
    void saveImages(QVariantList images);
};

#endif // FILEIO_H
