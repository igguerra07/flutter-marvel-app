import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/src/models/characters_data_model.dart';

void main() {
  test("Deve retornar uma instância de CharactersDataModel", () {
    final json = jsonDecode(jsonValid);

    expect(json["results"], isA<List>());

    final result = CharactersData.fromJson(json);

    expect(result, isA<CharactersData>());

    expect(result.results.length, 3);
  });

  test("""Deve retornar uma instância de CharactersDataModel mesmo
       se o atributo results for nulo""", () {
    final json = jsonDecode(jsonWithNullValue);

    expect(json["results"], null);

    final result = CharactersData.fromJson(json);

    expect(result, isA<CharactersData>());

    expect(result.results.isEmpty, true);
  });
}

const jsonValid = """ 
  {
    "results": [
      {
        "id": 1,
        "name" : "SuperHero01"
      },
      {
        "id": 2,
        "name" : "SuperHero02"
      },
      {
        "id": 3,
        "name" : "SuperHero03"
      }
    ]
  }
""";

const jsonWithNullValue = """ 
  {
    "results": null
  }
""";
