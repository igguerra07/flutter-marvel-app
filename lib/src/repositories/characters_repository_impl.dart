import 'package:marvel_app/src/datasources/remote/characters_remote_data.dart';
import 'package:marvel_app/src/entities/failure.dart';
import 'package:marvel_app/src/entities/character.dart';
import 'package:dartz/dartz.dart';
import 'package:marvel_app/src/repositories/characters_repository.dart';

class CharacteresRepostioryImpl implements CharactersRepository {
  late final CharactersRemoteDataSource _charactersRemoteDataSource;

  CharacteresRepostioryImpl({
    required CharactersRemoteDataSource charactersRemoteDataSource,
  }) {
    _charactersRemoteDataSource = charactersRemoteDataSource;
  }

  @override
  Future<Either<Failure, List<Character>>> getCharacters() async {
    try {
      final response = await _charactersRemoteDataSource.getCharacters();
      return right(response.data.results);
    } catch(e) {
      return left(ServerFailure(message: "message"));
    }
  }
}
