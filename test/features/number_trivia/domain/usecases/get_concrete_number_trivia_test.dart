import 'package:clean_project/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_project/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_project/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(
      repository: mockNumberTriviaRepository,
    );
  });
  const tNumber = 1;
  final tNumberTrivia = NumberTrivia(
    text: 'TESTE',
    number: 12,
  );

  test('should get trivia from repository', () async {


    when(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber))
        .thenAnswer(
      (_) async => Right(tNumberTrivia),
    );
    final result = await usecase.execute(
      number: tNumber,
    );
    expect(result, Right(tNumber),);
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
