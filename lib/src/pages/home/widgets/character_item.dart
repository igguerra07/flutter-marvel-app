import 'package:flutter/material.dart';
import 'package:marvel_app/resources/colors.dart';
import 'package:marvel_app/resources/gradients.dart';
import 'package:marvel_app/src/entities/character.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final deviceWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: deviceWidth * .4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              "${character.imageUrl}/portrait_medium.jpg",
              fit: BoxFit.cover,
            ),
            Container(
              decoration: GradientResource.darkGradient,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  character.name,
                  textAlign: TextAlign.center,
                  style: textTheme.headline4?.copyWith(
                    color: ColorResource.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
