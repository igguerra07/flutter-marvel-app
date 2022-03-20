import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/services/marvel_service.dart';
import 'package:marvel_app/src/datasources/remote/characters_remote_data.dart';
import 'package:marvel_app/src/datasources/remote/characters_remote_data_impl.dart';
import 'package:marvel_app/src/entities/exceptions.dart';
import 'package:marvel_app/src/models/character_model.dart';
import 'package:marvel_app/src/models/character_thumbnail_model.dart';
import 'package:marvel_app/src/models/characters_data_model.dart';
import 'package:marvel_app/src/models/characters_response_model.dart';
import 'package:mocktail/mocktail.dart';

class MockMarvelService extends Mock implements MarvelService {}

void main() {
  late MockMarvelService mockMarvelService;
  late CharactersRemoteDataSource charactersRemoteDataSource;

  final responseSuccess = CharactersResponse(
    data: CharactersData(
      results: [
        CharacterModel(
          id: 0,
          name: "SuperHero 01",
          imageUrl: CharacterThumbnailModel(path: ""),
        ),
      ],
    ),
  );

  setUp(() {
    mockMarvelService = MockMarvelService();
    charactersRemoteDataSource = CharactersRemoteDataSourceImpl(
      marvelService: mockMarvelService,
    );
  });

  test("""
        Deve retornar CharactersResponse caso a chamada tenha 
        sido realizada com sucesso
  """, () async {
    when(() => mockMarvelService.getCharacters()).thenAnswer(
      (_) async => responseSuccess,
    );

    final result = await charactersRemoteDataSource.getCharacters();

    verify(() => mockMarvelService.getCharacters()).called(1);

    expect(result, responseSuccess);

    verifyNoMoreInteractions(mockMarvelService);
  });
  test("""
        Deve retornar um ServerException caso a chamada tenha falhado
  """, () async {
    when(() => mockMarvelService.getCharacters()).thenThrow(
      (_) async => ServerException(),
    );

    final call = charactersRemoteDataSource.getCharacters;

    expect(() => call(), throwsA(isA<ServerException>()));

    verify(() => mockMarvelService.getCharacters()).called(1);

    verifyNoMoreInteractions(mockMarvelService);
  });
}
