#ifndef BTNIMAGES_H
#define BTNIMAGES_H

#include <QVariant>
#include <QJsonObject>

const QString mImgRoot = "../src/";    // 이미지 루트 폴더

class BtnImages {

    QMap<int, QString> matchings;       // 버튼 이미지 매칭 목록

    void setImages(QJsonObject btns);   // 이미지 목록 셋팅하기

public:
    BtnImages(QJsonObject btns);

    // public functions
    QVariant getImagePaths();                     // 이미지 목록 불러오기
    QJsonObject saveImages(QVariantList images);  // 이미지 목록 저장
};

#endif // BTNIMAGES_H

