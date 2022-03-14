import 'package:marvel_app/src/models/characters_response_model.dart';

abstract class CharactersRemoteDataSource {
  Future<CharactersResponse> getCharacters();
}
