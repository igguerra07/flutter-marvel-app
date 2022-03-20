import 'package:flutter/material.dart';
import 'package:marvel_app/resources/colors.dart';
import 'package:marvel_app/resources/icons.dart';
import 'package:marvel_app/resources/images.dart';

class MarvelAppBar extends StatelessWidget {
  const MarvelAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Row(
        children: [
          IconButton(
            onPressed: () => {},
            icon: Image.asset(IconResource.menu),
          ),
          Expanded(
            child: IconButton(
              onPressed: () => {},
              icon: Image.asset(
                ImageResource.marvelLogo,
                color: ColorResource.red,
              ),
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: Image.asset(IconResource.search),
          ),
        ],
      ),
    );
  }
}
