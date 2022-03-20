import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/src/entities/character.dart';
import 'package:marvel_app/src/entities/failure.dart';
import 'package:marvel_app/src/pages/home/home_change_notifier.dart';
import 'package:marvel_app/src/pages/home/home_page_state.dart';
import 'package:marvel_app/src/usescases/get_characters.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCharactersUseCase extends Mock implements GetCharacters {}

void main() {
  late MockGetCharactersUseCase mockGetCharacters;
  late CharactersChangeNotifier notifier;

  setUp(() {
    mockGetCharacters = MockGetCharactersUseCase();
    notifier = CharactersChangeNotifier(getCharacters: mockGetCharacters);
  });

  const charactersFromService = [
    Character(id: 0, name: "SuperHero01", imageUrl: ""),
    Character(id: 1, name: "SuperHero02", imageUrl: ""),
  ];

  final failure = ServerFailure(message: "Unable retrive data");

  test("O estado inicial deve ser HomeInitalState", () {
    expect(notifier.state, isA<HomeInitialState>());
  });

  test("""Deve retornar estado HomeEmptyState 
          quando a lista de personagens for vazia""", () async {
    //Quando chamada o requisição deve retornar a resposa
    when(() => mockGetCharacters.call()).thenAnswer((_) async => right([]));
    final response = notifier.getCharacters();

    verify(() => mockGetCharacters.call()).called(1);
    //checar se emitiu um estado de loading
    expect(notifier.state, isA<HomeLoadingState>());
    await response;
    //checar se emitiu um estado de sucesso
    expect(notifier.state, isA<HomeEmptyState>());
  });

  test("""Deve retornar estado HomeSuccesState 
          quando a lista de personagens não for vazia""", () async {
    //Quando chamada o requisição deve retornar a resposa
    when(() => mockGetCharacters.call()).thenAnswer(
      (_) async => right(charactersFromService),
    );

    final response = notifier.getCharacters();
    verify(() => mockGetCharacters.call()).called(1);
    //checar se emitiu um estado de loading
    expect(notifier.state, isA<HomeLoadingState>());
    await response;
    //Verificar resultado da API
    expect(
      (notifier.state as HomeSuccessState).characters,
      charactersFromService,
    );
    //checar se emitiu um estado de sucesso
    expect(notifier.state, isA<HomeSuccessState>());
  });
  test("""Deve retornar estado HomeFailureState
          quando não conseguir retonar a lista""", () async {
    //Quando chamada o requisição gerar um execção
    when(() => mockGetCharacters.call()).thenAnswer(
      (_) async => left(failure),
    );
    //Realizar ação
    await notifier.getCharacters();
    //checar se foi realizada somente um chamada
    verify(() => mockGetCharacters.call()).called(1);
    //checar se emitiu um estado de error
    expect(notifier.state, isA<HomeFailureState>());
    //checar se não a mais interação ao finalizar o ciclo
    verifyNoMoreInteractions(mockGetCharacters);
  });
}
