import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String kF_Adobe_arabic_shin = 'Adobe_arabic_shin';
const String kF_Adobe_shin_stouts = 'Adobe_shin_stouts';
const String kF_Air_Strip_Arabic = 'Air_Strip_Arabic';
const String kF_Aqlaam_Regular = 'Aqlaam_Regular';
const String kF_Bareeq_Regular = 'Bareeq_Regular';
const String kF_Bedayah_v11 = 'Bedayah_v11';
const String kF_B_NAZANIN = 'B_NAZANIN';
const String kF_Dima_Fantasy = 'Dima_Fantasy';
const String kF_Far_DastNevis = 'Far_DastNevis';
const String kF_hekayat = 'hekayat';
const String kF_Nishan_Regular = 'Nishan_Regular';
const String kF_Rawafed_Zainab = 'Rawafed_Zainab';
const String kF_Sulimany_V2_Bold_Ornamented = 'Sulimany_V2_Bold_Ornamented';
const String kF_Sulimany_V2_Bold_Regular = 'Sulimany_V2_Bold_Regular';
const String kF_Vazir = 'Vazir';

mixin persianTextHelper {
  String fixPersianText(String brokenPersianString) {
    Map<String, String> fixMap = {'ی': 'ي'};
    String fixes = '';
    brokenPersianString.split('').forEach((String letter) {
      if (fixMap[letter] != null) {
        fixes = fixes + fixMap[letter];
      } else {
        fixes = fixes + letter;
        /* TODO: letter +fixes != fixes + letter test it return fixes.split('').reversed.join();*/
      }
    });
    return fixes;
  }
}
mixin persianNumberHelper {
  String stringPersianNumberOf(String latinNumber) {
    //TODO: هر چقدمحاسبه دارید بیرون با استفاده از تایپ های عددی انجام دهید این فقط برای نمایش در یوآی هست دایرکشن ندارند قطعا جون نامبریک است
    Map<String, String> fixMap = {
      '1': '۱',
      '2': '۲',
      '3': '۳',
      '4': '۴',
      '5': '۵',
      '6': '۶',
      '7': '۷',
      '8': '۸',
      '9': '۹',
      '0': '۰',
      '.': '٫'
    };
    String fixed = '';

    latinNumber.split('').forEach((String digit) {
      fixed = fixed + fixMap[digit];
    });
    return fixed;
  }
}


const List fonts = [
  kF_Adobe_arabic_shin,
  kF_Adobe_shin_stouts,
  kF_Air_Strip_Arabic,
  kF_Aqlaam_Regular,
  kF_Bareeq_Regular,
  kF_Bedayah_v11,
  kF_B_NAZANIN,
  kF_Dima_Fantasy,
  kF_Far_DastNevis,
  kF_hekayat,
  kF_Nishan_Regular,
  kF_Rawafed_Zainab,
  kF_Sulimany_V2_Bold_Ornamented,
  kF_Sulimany_V2_Bold_Regular,
  kF_Vazir,
];

String stringPersianNumberOf(String latinNumber) {
  //TODO: هر چقدمحاسبه دارید بیرون با استفاده از تایپ های عددی انجام دهید این فقط برای نمایش در یوآی هست دایرکشن ندارند قطعا جون نامبریک است
  Map<String, String> fixMap = {
    '1': '۱',
    '2': '۲',
    '3': '۳',
    '4': '۴',
    '5': '۵',
    '6': '۶',
    '7': '۷',
    '8': '۸',
    '9': '۹',
    '0': '۰',
    '.': '٫'
  };
  String fixed = '';

  latinNumber.split('').forEach((String digit) {
    fixed = fixed + fixMap[digit]??'';
  });
  return fixed;
}

String fixPersianText(String brokenPersianString) {
  Map<String, String> fixMap = {'ی': 'ي'};
  String fixes = '';
  brokenPersianString.split('').forEach((String letter) {
    if (fixMap[letter] != null) {
      fixes = fixes + fixMap[letter];
    } else {
      fixes = fixes + letter;
      /* TODO: letter +fixes != fixes + letter test it return fixes.split('').reversed.join();*/
    }
  });
  return fixes;
}
