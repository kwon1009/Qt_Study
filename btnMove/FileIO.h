#ifndef FILEIO_H
#define FILEIO_H

#include <QFile>
#include <QVector>

class FileIO {

    QString mFileRoot = "./";
    QString mFileName;
    QVector<QString> mFileList;

    void read(QString filename);
    void write(QString filename);

public:
    FileIO(QString filename);
};

#endif // FILEIO_H
