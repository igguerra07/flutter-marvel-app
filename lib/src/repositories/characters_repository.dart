import 'package:dartz/dartz.dart';
import 'package:marvel_app/src/entities/character.dart';
import 'package:marvel_app/src/entities/failure.dart';

abstract class CharactersRepository {
  Future<Either<Failure, List<Character>>> getCharacters();
}