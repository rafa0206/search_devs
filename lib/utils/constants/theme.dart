import 'package:flutter/material.dart';

class AppTheme {

  static const mainBlue = Color(0xff0069CA);
  static const mainPurple = Color(0xff8C19D2);
  static const mainLightPurple = Color(0xffEADDFF);
  static const mainBlackBlue = Color(0xff171923);
  static const mainWhite = Color(0xffffffff);
  static const mainDarkGrey = Color(0xff2D3748);
  static const mainGrey = Color(0xff4A5568);
  static const mainLightGrey = Color(0xffE2E8F0);
  static const mainMediumGrey = Color(0xffA0AEC0);
  static const mainWhiteBackground = Color(0xffFCFCFC);

  static const mainTitleTextStyle = TextStyle(
    fontSize: 50,
    fontFamily: 'Nunito',
    color: mainBlue,
  );

  static const titleTextStyle = TextStyle(
    fontSize: 20,
    fontFamily: 'Inter',
    color: mainBlackBlue,
    fontWeight: FontWeight.w700,
  );

  static const defaultTextStyle = TextStyle(
    fontSize: 16,
    fontFamily: 'Inter',
    color: mainGrey,
  );

  static const iconTextStyle = TextStyle(
    fontSize: 14,
    fontFamily: 'Inter',
    color: mainGrey,
  );

}
