import 'package:clean_project/core/error/failures.dart';
import 'package:clean_project/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_project/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia({
    required this.repository,
  });

  Future<Either<Failure, NumberTrivia>> execute({
    required int number,
  }) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
