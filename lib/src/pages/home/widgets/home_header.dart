import 'package:flutter/material.dart';
import 'package:marvel_app/resources/colors.dart';
import 'package:marvel_app/resources/strings.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            StringResource.welcome,
            style: textTheme.headline1?.copyWith(
              color: ColorResource.grey,
            ),
          ),
          Text(
            StringResource.chooseHero,
            style: textTheme.headline5?.copyWith(
              color: ColorResource.white,
            ),
          ),
        ],
      ),
    );
  }
}
