import 'package:marvel_app/src/entities/character.dart';

class CharacterModel extends Character {
  const CharacterModel({
    required int id,
    required String name,
  }) : super(id: id, name: name);

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"],
        name: json["name"],
      );
}
