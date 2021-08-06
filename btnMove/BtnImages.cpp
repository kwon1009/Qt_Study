#include "BtnImages.h"

#include <QDebug>

BtnImages::BtnImages() {
    mImgFileIO = new FileIO(mImgFileName);
}

void BtnImages::setImages() {
    QVector<QString> contents = mImgFileIO->read();
    // set matching
    for(int i=0; i<contents.size(); i++) {
        int btnNo = (contents[i].split(":")[0]).toInt();
        QString imgName = contents[i].split(":")[1];
        matchings[btnNo] = imgName;
    }
}

// public functions
QVariant BtnImages::getImagePaths() {
    setImages();
    QVariantList mPaths = {};
    for(int i=0; i<matchings.size(); i++) {
        mPaths.append(mImgRoot + matchings[i]);
    }
    return QVariant(mPaths);
}

void BtnImages::saveImages(QVariantList images) {
    QVector<QString> contents;

    for(int i=0; i<images.size(); i++) {
        // change mMatchings
        QString imgName = images[i].toString().split("/").back();
        QString content = QString("%1").arg(i) + ":" + imgName;
        contents.append(content);
    }

    // save file
    mImgFileIO->write(contents);
}
