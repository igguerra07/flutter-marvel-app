import 'package:dartz/dartz.dart';
import 'package:marvel_app/src/entities/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}