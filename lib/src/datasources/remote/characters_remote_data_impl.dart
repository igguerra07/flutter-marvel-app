import 'package:marvel_app/services/marvel_service.dart';
import 'package:marvel_app/src/datasources/remote/characters_remote_data.dart';
import 'package:marvel_app/src/entities/exceptions.dart';
import 'package:marvel_app/src/models/characters_response_model.dart';

class CharactersRemoteDataSourceImpl implements CharactersRemoteDataSource {
  late final MarvelService _marvelService;

  CharactersRemoteDataSourceImpl({
    required MarvelService marvelService,
  }) {
    _marvelService = marvelService;
  }

  @override
  Future<CharactersResponse> getCharacters() async {
    try {
      return await _marvelService.getCharacters();
    } catch (e) {
      throw ServerException();
    }
  }
}
