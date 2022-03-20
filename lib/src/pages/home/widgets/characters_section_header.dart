import 'package:flutter/material.dart';
import 'package:marvel_app/resources/colors.dart';
import 'package:marvel_app/resources/strings.dart';

class CharactersSectionHeader extends StatelessWidget {
  final String sectionText;

  const CharactersSectionHeader({
    Key? key,
    required this.sectionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionText,
          style: textTheme.headline4?.copyWith(
            color: ColorResource.red,
          ),
        ),
        Text(
          StringResource.seeMore,
          style: textTheme.subtitle1?.copyWith(
            color: ColorResource.grey,
          ),
        ),
      ],
    );
  }
}
