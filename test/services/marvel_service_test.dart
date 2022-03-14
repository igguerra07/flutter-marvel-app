import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_app/services/marvel_service.dart';
import 'package:marvel_app/src/entities/exceptions.dart';
import 'package:marvel_app/src/models/characters_response_model.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late MarvelService marvelService;

  setUpAll(() {
    registerFallbackValue(Uri.parse(""));
  });

  setUp(() {
    mockHttpClient = MockHttpClient();
    marvelService = MarvelService(client: mockHttpClient);
  });

  test("Deve retornar um json de CharactersResponse quando for 200", () async {
    when(() => mockHttpClient.get(any())).thenAnswer(
      (_) async => http.Response(jsonResponse, 200),
    );

    final result = await marvelService.getCharacters();

    verify(() => mockHttpClient.get(any())).called(1);

    expect(result, isA<CharactersResponse>());
    expect(result.data.results.length, 0);
  });
  test("""
  Deve retornar uma ServerException quando for 
  qualquer código diferente de 200
  """, () async {
    when(() => mockHttpClient.get(any())).thenAnswer(
      (_) async => http.Response("Error", 400),
    );

    final call = marvelService.getCharacters;

    expect(() => call(), throwsA(isA<ServerException>()));

    verify(() => mockHttpClient.get(any())).called(1);

    verifyNoMoreInteractions(mockHttpClient);
  });
}

const jsonResponse = """ 
  {
    "data": {
      "results": [
        {
          "id": 0,
          "name": "SuperHero 00"
        }
      ]
    }
  }
""";
