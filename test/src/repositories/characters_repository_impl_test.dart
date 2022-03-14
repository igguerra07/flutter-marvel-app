import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/src/datasources/remote/characters_remote_data.dart';
import 'package:marvel_app/src/entities/exceptions.dart';
import 'package:marvel_app/src/entities/failure.dart';
import 'package:marvel_app/src/models/character_model.dart';
import 'package:marvel_app/src/models/characters_data_model.dart';
import 'package:marvel_app/src/models/characters_response_model.dart';
import 'package:marvel_app/src/repositories/characters_repository.dart';
import 'package:marvel_app/src/repositories/characters_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockCharacteresRemoteDataSource extends Mock
    implements CharactersRemoteDataSource {}

void main() {
  late MockCharacteresRemoteDataSource mockCharacteresRemoteDataSource;
  late CharactersRepository charactersRepository;

  final successResponse = CharactersResponse(
    data: CharactersData(
      results: const [
        CharacterModel(id: 1, name: "SuperHero 01")
      ],
    ),
  );

  final failureResponse = ServerFailure(message: "message");

  setUp(() {
    mockCharacteresRemoteDataSource = MockCharacteresRemoteDataSource();
    charactersRepository = CharacteresRepostioryImpl(
      charactersRemoteDataSource: mockCharacteresRemoteDataSource,
    );
  });
  test("""
      Deve retornar uma right function CharactersResponse caso a 
      chamada tenha tido sucesso
      """, () async {
    when(() => mockCharacteresRemoteDataSource.getCharacters()).thenAnswer(
      (_) async => successResponse,
    );

    final result = await charactersRepository.getCharacters();

    verify(() => mockCharacteresRemoteDataSource.getCharacters()).called(1);

    expect(result, right(successResponse.data.results));
  });
  test("""
      Deve retornar uma left function ServerFailure caso a 
      chamada tenha falhado
      """, () async {
    when(() => mockCharacteresRemoteDataSource.getCharacters())
        .thenThrow(ServerException());

    final result = await charactersRepository.getCharacters();

    verify(() => mockCharacteresRemoteDataSource.getCharacters()).called(1);
    
    expect(result, left(failureResponse));
  });
}
