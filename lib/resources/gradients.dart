import 'package:flutter/material.dart';
import 'package:marvel_app/resources/colors.dart';

class GradientResource {
  static final darkGradient = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        ColorResource.black.withAlpha(0),
        ColorResource.black.withAlpha(10),
        ColorResource.black.withAlpha(255),
      ],
    ),
  );
}
