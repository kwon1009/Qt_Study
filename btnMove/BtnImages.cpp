#include "BtnImages.h"

#include <QDebug>

BtnImages::BtnImages(QJsonObject btns) {
    setImages(btns);
    qDebug() << "Setting Button Images complete.";
}

void BtnImages::setImages(QJsonObject btns) {
    // set matching
    for(int i=0; i<btns.size(); i++) {
        QString imgName = btns[QString("%1").arg(i)].toString();
        matchings[i] = imgName;
    }
}

// public functions
QVariant BtnImages::getImagePaths() {
    QVariantList mPaths = {};
    for(int i=0; i<matchings.size(); i++) {
        mPaths.append(mImgRoot + matchings[i]);
    }
    return QVariant(mPaths);
}

QJsonObject BtnImages::saveImages(QVariantList images) {
    QJsonObject btn;
    for(int i=0; i<images.size(); i++) {
        QString imgName = images[i].toString().split("/").back();
        btn[QString("%1").arg(i)] = imgName;
        matchings[i] = imgName;
    }

    QJsonObject btns;
    btns["btns"] = btn;
    return btns;
}
