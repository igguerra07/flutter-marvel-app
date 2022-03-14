import 'package:marvel_app/src/models/character_model.dart';
import 'package:marvel_app/src/models/characters_data_model.dart';

class CharactersResponse {
  CharactersData data;

  CharactersResponse({
    required this.data,
  });

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      CharactersResponse(
        data: CharactersData.fromJson(json["data"]),
      );
}
