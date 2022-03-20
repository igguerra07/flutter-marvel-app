import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/src/entities/character.dart';
import 'package:marvel_app/src/entities/failure.dart';
import 'package:marvel_app/src/repositories/characters_repository.dart';
import 'package:marvel_app/src/usescases/get_characters.dart';
import 'package:mocktail/mocktail.dart';

class MockCharactersRepository extends Mock implements CharactersRepository {}

void main() {
  late MockCharactersRepository mockCharactersRepository;
  late GetCharacters getCharactersUseCase;

  const charactersFromRepository = [
    Character(id: 0, name: "Super Hero 1", imageUrl: ""),
    Character(id: 1, name: "Super Hero 2", imageUrl: ""),
    Character(id: 2, name: "Super Hero 3", imageUrl: ""),
  ];

  final failureFromRepository = ServerFailure(
    message: "Unable retrive data",
  );

  setUp(() {
    mockCharactersRepository = MockCharactersRepository();
    getCharactersUseCase = GetCharacters(
      charactersRepository: mockCharactersRepository,
    );
  });

  test("Deve obter umas lista de personagens", () async {
    when(() => mockCharactersRepository.getCharacters()).thenAnswer(
      (_) async => right(charactersFromRepository),
    );

    final result = await getCharactersUseCase.call();

    expect(result, right(charactersFromRepository));

    verify(() => mockCharactersRepository.getCharacters());

    verifyNoMoreInteractions(mockCharactersRepository);
  });

  test("""Deve retornar uma falha caso não 
      consiga obter a lista de personages""", () async {
    when(() => mockCharactersRepository.getCharacters()).thenAnswer(
      (_) async => left(failureFromRepository),
    );

    final result = await getCharactersUseCase.call();

    expect(result, left(failureFromRepository));

    verify(() => mockCharactersRepository.getCharacters());

    verifyNoMoreInteractions(mockCharactersRepository);
  });
}
