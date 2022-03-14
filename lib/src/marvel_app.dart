import 'package:flutter/material.dart';
import 'package:marvel_app/resources/strings.dart';
import 'package:marvel_app/src/pages/home/home_page.dart';

class MarvelApp extends StatefulWidget {
  const MarvelApp({Key? key}) : super(key: key);

  @override
  State<MarvelApp> createState() => _MarvelAppState();
}

class _MarvelAppState extends State<MarvelApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: StringResource.appTitle,
      home: HomePage(),
    );
  }
}