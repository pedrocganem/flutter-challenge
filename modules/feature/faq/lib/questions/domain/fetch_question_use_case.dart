import 'package:FAQ/questions/data/models/question_model.dart';
import 'package:FAQ/questions/data/models/question_use_case_error.dart';
import 'package:FAQ/questions/data/repositories/questions_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:foundation/generics/result.dart';

abstract class FetchQuestionsUseCase {
  Future<Result<List<QuestionModel>, QuestionUseCaseError>> fetchQuestions(
      String referenceKey);
}

class DefaultFetchQuestionsUseCase implements FetchQuestionsUseCase {
  final _repository = Modular.get<QuestionRepository>();

  @override
  Future<Result<List<QuestionModel>, QuestionUseCaseError>> fetchQuestions(
      String referenceKey) async {
    final result = await _repository.fetchQuestions(referenceKey);
    if (result.error != null)
      return Result(error: QuestionUseCaseError.repositoryError);
    final questionList = result.result;
    return Result(result: questionList);
  }
}
