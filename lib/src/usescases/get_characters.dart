import 'package:dartz/dartz.dart';
import 'package:marvel_app/src/entities/character.dart';
import 'package:marvel_app/src/entities/failure.dart';
import 'package:marvel_app/src/repositories/characters_repository.dart';

class GetCharacters {
  late final CharactersRepository _charactersRepository;

  GetCharacters({
    required CharactersRepository charactersRepository,
  }) {
    _charactersRepository = charactersRepository;
  }

  Future<Either<Failure, List<Character>>> call() async {
    return await _charactersRepository.getCharacters();
  }
}
