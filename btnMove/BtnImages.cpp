#include "BtnImages.h"

#include <QDebug>

BtnImages::BtnImages() {
    mImgFileIO = new FileIO(mImgFileName);
    mJSONController = new JSONController(mJSONFile);
}

void BtnImages::setImages() {
    QJsonObject btns = mJSONController->getJsonObj("btns");
    // set matching
    for(int i=0; i<btns.size(); i++) {
        QString imgName = btns[QString("%1").arg(i)].toString();
        matchings[i] = imgName;
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
    QJsonObject btn;
    for(int i=0; i<images.size(); i++) {
        QString imgName = images[i].toString().split("/").back();
        btn[QString("%1").arg(i)] = imgName;
    }

    QJsonObject btns;
    btns["btns"] = btn;
    mJSONController->write(btns);
}
