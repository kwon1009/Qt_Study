#include "BtnImages.h"

#include <QDebug>

BtnImages::BtnImages(QString imgPath, QJsonObject btns) {
    mImgRoot = imgPath;
    setImages(btns);
}

void BtnImages::setImages(QJsonObject btns) {
    // set matching
    for(int i=0; i<btns.size(); i++) {
        QString imgName = btns[QString("%1").arg(i)].toString();
        matchings[i] = imgName;
    }
    qDebug() << "BtnImages: Setting Button Images complete.";
}

// public functions
QVariant BtnImages::getImagePaths() {
    QVariantList mPaths = {};
    for(int i=0; i<matchings.size(); i++) {
        mPaths.append(mImgRoot + matchings[i]);
    }
    qDebug() << "BtnImages: Getting Button Image complete.";
    return QVariant(mPaths);
}

QJsonObject BtnImages::saveImages(QVariantList images) {
    QJsonObject btns;
    for(int i=0; i<images.size(); i++) {
        QString imgName = images[i].toString().split("/").back();
        btns[QString("%1").arg(i)] = imgName;
        matchings[i] = imgName;
    }
    qDebug() << "BtnImages: Saving Button Image complete.";
    return btns;
}
