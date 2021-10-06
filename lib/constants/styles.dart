import 'package:flutter/material.dart';
import 'package:social_media_ui_app/constants/fonts.dart';

const TextStyle kHeroTS = TextStyle(
    fontFamily: kF_Aqlaam_Regular,
    fontWeight: FontWeight.w200,
    fontSize: 60,
    letterSpacing: 3);

const TextStyle kBtnTS =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w600);
const TextStyle kHintTS =
    TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.grey);
const TextStyle kNormalTS =
    TextStyle(fontSize: 13, fontWeight: FontWeight.w600);
Color kPrimaryColor(context) => Theme.of(context).primaryColor;
Color kAccentColor(context) => Theme.of(context).accentColor;
