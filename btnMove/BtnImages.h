#ifndef BTNIMAGES_H
#define BTNIMAGES_H

#include <QVariant>

#include "FileIO.h"     // 이미지 정보를 관리하기 위한 파일IO

class BtnImages {

    FileIO* mImgFileIO;

    QString mImgFileName = "matching.txt";
    QString mImgRoot = "./src/";    // 이미지 루트 폴더
    QMap<int, QString> matchings;   // 버튼 이미지 매칭 목록

    void setImages();               // 이미지 목록 셋팅하기

public:
    BtnImages();

    // public functions
    QVariant getImagePaths();               // 이미지 목록 불러오기
    void saveImages(QVariantList images);   // 이미지 목록 저장
};

#endif // BTNIMAGES_H

