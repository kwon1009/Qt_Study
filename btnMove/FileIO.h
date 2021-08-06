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

    void read();
//    void write(QString filename);
    void write();
    void setMatchings();

public:
    FileIO(QString filename);
    QMap<int, QString> getMatchings();
    void saveImages(QVariantList images);
};

#endif // FILEIO_H
