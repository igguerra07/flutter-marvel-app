import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/src/entities/character.dart';
import 'package:marvel_app/src/models/character_model.dart';
import 'package:marvel_app/src/models/character_thumbnail_model.dart';

void main() {
  final characterModel = CharacterModel(
    id: 0,
    name: "SuperHero 01",
    imageUrl: CharacterThumbnailModel(path: ""),
  );

  test('Deve ser extender Character', () {
    expect(characterModel, isA<Character>());
  });

  group("fromJson", () {
    test("Deve devolver uma instância de CharacterModel", () {
      final Map<String, dynamic> json = jsonDecode(jsonValid);

      final result = CharacterModel.fromJson(json);

      expect(result, isA<CharacterModel>());
    });

    test("Deve devolver TypeError caso o json seja inválido", () {
      final Map<String, dynamic> json = jsonDecode(jsonInvalid);

      const call = CharacterModel.fromJson;
      expect(() => call(json), throwsA(isA<TypeError>()));
    });
  });
}

const jsonValid = """
  {
    "id": 1,
    "name": "SuperHero 01",
    "thumbnail": {
      "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
      "extension": "jpg"
    }
  }
""";

const jsonInvalid = """
  {
    "id": "1",
    "name": "SuperHero 01",
    "thumbnail": {
      "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
      "extension": "jpg"
    }
  }
""";
