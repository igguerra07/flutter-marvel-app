import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/src/models/characters_response_model.dart';

void main() {
  test("""  
    Deve retonar instância de CharactersResponseModel 
    caso o json seja válido
  """, () {
    final json = jsonDecode(jsonValid);

    final result = CharactersResponse.fromJson(json);

    expect(result, isA<CharactersResponse>());
  });
}

const jsonValid = """ 
  {
    "data" : {
      "results": [
        { 
          "id": 1,
          "name": "SuperHero 01"
        }
      ]
    }
  }
""";
