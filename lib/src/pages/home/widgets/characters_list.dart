import 'package:flutter/material.dart';
import 'package:marvel_app/src/entities/character.dart';
import 'package:marvel_app/src/pages/home/widgets/character_item.dart';

class CharactersList extends StatelessWidget {
  final List<Character> characters;

  const CharactersList({
    Key? key,
    required this.characters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: characters.length,
      itemBuilder: (_, index) => CharacterItem(
        character: characters[index],
      ),
      separatorBuilder: (_, __) => const SizedBox(width: 16),
    );
  }
}
