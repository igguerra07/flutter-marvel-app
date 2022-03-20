import 'package:flutter/material.dart';
import 'package:marvel_app/src/entities/character.dart';
import 'package:marvel_app/src/pages/home/widgets/characters_list.dart';
import 'package:marvel_app/src/pages/home/widgets/characters_section_header.dart';

class CharactersSection extends StatelessWidget {
  final String sectionText;
  final List<Character> characters;

  const CharactersSection({
    Key? key,
    required this.sectionText,
    required this.characters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CharactersSectionHeader(
          sectionText: sectionText,
        ),
        const SizedBox(height: 8),
        Expanded(
          child: CharactersList(
            characters: characters,
          ),
        ),
      ],
    );
  }
}
