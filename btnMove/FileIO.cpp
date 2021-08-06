
#include "FileIO.h"

#include <QDebug>

FileIO::FileIO(QString filename) {
    mFileName = filename;
    qDebug() << filename;
    read(filename);
}

void FileIO::read(QString filename) {
    QString filePath = mFileRoot + filename;
    QFile file(filename);

    if(!file.open(QFile::ReadOnly | QFile::Text)) {
        qDebug() << "Could not open file for read";
        return;
    }

    QTextStream in(&file);
    while (!in.atEnd()) {
        QString line = in.readLine();
        mFileList.push_back(line);
    }

    for(int i=0; i<mFileList.size(); i++) {
        qDebug() << mFileList[i];
    }
    file.close();
}

void FileIO::write(QString filename) {
    QString filePath = mFileRoot + filename;
    QFile file(filename);

    if(!file.open(QFile::WriteOnly | QFile::Text)) {
        qDebug() << "Could not open file for write";
        return;
    }

    QTextStream out(&file);
    out << "The magic number is: " << 49 << "\n";
    file.close();
}
