import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final int id;
  final String name;

  const Character({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
