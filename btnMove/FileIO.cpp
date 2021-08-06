
#include "FileIO.h"

#include <QDebug>

FileIO::FileIO(QString filename) {
    mFileName = filename;
    read();
    setMatchings();
}

void FileIO::read() {
    QString filePath = mFileRoot + mFileName;
    QFile file(filePath);

    if(!file.open(QFile::ReadOnly | QFile::Text)) {
        qDebug() << "Could not open file for read";
        return;
    }

    QTextStream in(&file);
    while (!in.atEnd()) {
        QString line = in.readLine();
        mFileList.push_back(line);
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

void FileIO::setMatchings() {
    for(int i=0; i<mFileList.size(); i++) {
        int btnNo = (mFileList[i].split(":")[0]).toInt();
        QString imgName = mFileList[i].split(":")[1];
        mMatchings[btnNo] = imgName;
    }
}

QMap<int, QString> FileIO::getMatchings() {
    return mMatchings;
}
