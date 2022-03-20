import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvel_app/resources/strings.dart';
import 'package:marvel_app/src/pages/home/home_page.dart';
import 'package:marvel_app/theme/theme_service.dart';

class MarvelApp extends StatefulWidget {
  const MarvelApp({Key? key}) : super(key: key);

  @override
  State<MarvelApp> createState() => _MarvelAppState();
}

class _MarvelAppState extends State<MarvelApp> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: theme.brightness == Brightness.light
            ? Brightness.dark
            : Brightness.light,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringResource.appTitle,
        home: const HomePage(),
        theme: ThemeService.appDarkTheme,
      ),
    );
  }
}
