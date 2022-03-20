import 'package:flutter/material.dart';
import 'package:marvel_app/resources/colors.dart';
import 'package:marvel_app/theme/app_bar_theme.dart' as app;
import 'package:marvel_app/theme/text_theme.dart';

class ThemeService {
  static get appLightTheme => ThemeData.light().copyWith(
        textTheme: AppTextTheme.getAppTextLightTheme(),
        appBarTheme: app.AppBarTheme.appBarLightTheme,
        scaffoldBackgroundColor: ColorResource.silver,
      );

  static get appDarkTheme => ThemeData.dark().copyWith(
        textTheme: AppTextTheme.getAppTextDarkTheme(),
        appBarTheme: app.AppBarTheme.appBarDarkTheme,
        scaffoldBackgroundColor: ColorResource.dark,
      );
}
