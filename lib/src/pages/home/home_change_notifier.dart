import 'package:flutter/material.dart';
import 'package:marvel_app/src/pages/home/home_page_state.dart';
import 'package:marvel_app/src/usescases/get_characters.dart';

class CharactersChangeNotifier extends ChangeNotifier {
  late final GetCharacters _getCharacters;

  CharactersChangeNotifier({
    required GetCharacters getCharacters,
  }) {
    _getCharacters = getCharacters;
  }

  HomeState _state = HomeInitialState();

  HomeState get state => _state;

  Future<void> getCharacters() async {
    _state = HomeLoadingState();
    notifyListeners();

    final eitherResponse = await _getCharacters.call();

    eitherResponse.fold(
      (error) {
        _state = HomeFailureState(error: error);
        notifyListeners();
      },
      (characters) {
        if (characters.isEmpty) {
          _state = HomeEmptyState();
        } else {
          _state = HomeSuccessState(characters: characters);
        }
        notifyListeners();
      },
    );
  }
}
