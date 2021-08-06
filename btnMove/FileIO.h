#ifndef FILEIO_H
#define FILEIO_H

#include <QFile>
#include <QVector>
#include <QMap>

class FileIO {

    QString mFileRoot = "./";
    QString mFileName;
    QVector<QString> mFileList;

    QMap<int, QString> mMatchings;

    void read();
    void write(QString filename);
    void setMatchings();

public:
    FileIO(QString filename);
    QMap<int, QString> getMatchings();
};

#endif // FILEIO_H
