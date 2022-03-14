import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/src/entities/character.dart';
import 'package:marvel_app/src/models/character_model.dart';

void main() {
  const CharacterModel characterModel = CharacterModel(
    id: 0,
    name: "Super Hero 01",
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

      expect(() => CharacterModel.fromJson(json), throwsA(isA<TypeError>()));
    });

  });
}

const jsonValid = """
  {
    "id": 1,
    "name": "SuperHero 01"
  }
""";

const jsonInvalid = """
  {
    "id": "1",
    "name": "SuperHero 01"
  }
""";
