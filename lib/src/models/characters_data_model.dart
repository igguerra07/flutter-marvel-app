import 'package:marvel_app/src/models/character_model.dart';

class CharactersData {
  final List<CharacterModel> results;

  CharactersData({
    required this.results,
  });

  factory CharactersData.fromJson(Map<String, dynamic> json) => CharactersData(
        results: List.from(json["results"] ?? [])
            .map((jsonCharacter) => CharacterModel.fromJson(jsonCharacter))
            .toList(),
      );
}
