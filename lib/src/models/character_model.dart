import 'package:marvel_app/src/entities/character.dart';
import 'package:marvel_app/src/models/character_thumbnail_model.dart';

class CharacterModel extends Character {
  CharacterModel({
    required int id,
    required String name,
    required CharacterThumbnailModel imageUrl,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl.path,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"],
        name: json["name"],
        imageUrl: CharacterThumbnailModel.fromJson(json["thumbnail"]),
      );
}
