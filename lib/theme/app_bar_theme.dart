import 'package:flutter/material.dart' as f;
import 'package:marvel_app/resources/colors.dart';

class AppBarTheme {
  static get appBarLightTheme => const f.AppBarTheme(
    elevation: 0,
    backgroundColor: ColorResource.silver,
  );

  static get appBarDarkTheme => const f.AppBarTheme(
    elevation: 0,
    backgroundColor: ColorResource.dark,
  );
}
