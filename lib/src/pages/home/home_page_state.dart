import 'package:marvel_app/src/entities/character.dart';
import 'package:marvel_app/src/entities/failure.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeEmptyState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<Character> characters;

  HomeSuccessState({
    required this.characters,
  });
}

class HomeFailureState extends HomeState {
  final Failure error;

  HomeFailureState({
    required this.error,
  });
}
