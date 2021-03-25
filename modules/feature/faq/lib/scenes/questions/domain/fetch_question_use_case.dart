import 'package:FAQ/scenes/questions/data/repositories/questions_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:foundation/generics/result.dart';
import 'package:FAQ/scenes/questions/data/models/question_use_case_error.dart';
import 'package:models/models.dart';

abstract class FetchQuestionsUseCase {
  Future<Result<List<QuestionModel>, QuestionUseCaseError>> fetchQuestions(
      String query);
}

class DefaultFetchQuestionsUseCase implements FetchQuestionsUseCase {
  final _repository = Modular.get<QuestionRepository>();

  @override
  Future<Result<List<QuestionModel>, QuestionUseCaseError>> fetchQuestions(
      String query) async {
    final result =  await _repository.fetchQuestions(query);
    if (result.result == null)
      return Result(error: QuestionUseCaseError.repositoryError);
    final questionList = result.result;
    return Result(result: questionList);
  }
}
