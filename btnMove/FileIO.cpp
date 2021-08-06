
#include "FileIO.h"

#include <QDebug>

FileIO::FileIO(QString filename) {
    mFileName = filename;
    QVector<QString> contents = read();
}

QVector<QString> FileIO::read() {
    QVector<QString> contents;
    QString filePath = mFileRoot + mFileName;
    QFile file(filePath);

    if(!file.open(QFile::ReadOnly | QFile::Text)) {
        qDebug() << "Could not open file for read";
        return contents;
    }

    QTextStream in(&file);
    while (!in.atEnd()) {
        QString line = in.readLine();
        contents.push_back(line);
    }

    file.close();
    return contents;
}

void FileIO::write(QVector<QString> contents) {
    QString filePath = mFileRoot + mFileName;
    QFile file(filePath);

    if(!file.open(QFile::WriteOnly | QFile::Text)) {
        qDebug() << "Could not open file for write";
        return;
    }

    QTextStream out(&file);
    for(int i=0; i<contents.size(); i++) {
        out << contents[i] << "\n";
    }
    file.close();
}
