import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static get _serifProTextTheme => GoogleFonts.nunitoSansTextTheme();
  static get _bigShouldersTextTheme => GoogleFonts.bigShouldersTextTextTheme();

  static TextStyle? get headline6 => _bigShouldersTextTheme.headline6?.copyWith(
        fontSize: 40.0,
        fontWeight: FontWeight.w900,
      );

  static TextStyle? get headline5 => _bigShouldersTextTheme.headline5?.copyWith(
        fontSize: 32.0,
        fontWeight: FontWeight.w800,
      );

  static TextStyle? get headline4 => _bigShouldersTextTheme.headline4?.copyWith(
        fontSize: 20.0,
        fontWeight: FontWeight.w900,
      );

  static TextStyle? get headline3 => _serifProTextTheme.headline3?.copyWith(
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
      );

  static TextStyle? get headline2 => _serifProTextTheme.headline2?.copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      );

  static TextStyle? get headline1 => _serifProTextTheme.headline1?.copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
      );

  static TextStyle? get subtitle2 => _serifProTextTheme.subtitle2?.copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
      );

  static TextStyle? get subtitle1 => _serifProTextTheme.subtitle1?.copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      );

  static TextStyle? get bodyText1 => _serifProTextTheme.bodyText1?.copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      );

  static TextStyle? get bodyText2 => _serifProTextTheme.subtitle2?.copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
      );

  static getAppTextLightTheme() => TextTheme(
        headline6: headline6,
        headline5: headline5,
        headline4: headline4,
        headline3: headline3,
        headline2: headline2,
        headline1: headline1,
        subtitle1: subtitle1,
        subtitle2: subtitle2,
        bodyText1: bodyText1,
        bodyText2: bodyText2,
      );

  static getAppTextDarkTheme() => TextTheme(
        headline6: headline6,
        headline5: headline5,
        headline4: headline4,
        headline3: headline3,
        headline2: headline2,
        headline1: headline1,
        subtitle1: subtitle1,
        subtitle2: subtitle2,
        bodyText1: bodyText1,
        bodyText2: bodyText2,
      );
}
