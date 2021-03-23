import 'dart:convert';
import 'package:FAQ/scenes/questions/data/models/question_repository_error.dart';
import 'package:FAQ/scenes/questions/data/services/questions_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:foundation/generics/result.dart';
import 'package:models/models.dart';

abstract class QuestionRepository {
  Future<Result<List<QuestionModel>, QuestionRepositoryError>> fetchQuestions(
      String query);
}

class DefaultQuestionRepository implements QuestionRepository {
  final _service = Modular.get<QuestionService>();

  @override
  Future<Result<List<QuestionModel>, QuestionRepositoryError>> fetchQuestions(
      String query) async {
    final result = await _service.fetchQuestions(query);
    print('repo -------> ${result.result}');
    if (result.error != null)
      return Result(error: QuestionRepositoryError.serviceError);
    List<QuestionModel> questionList = List<QuestionModel>.from(
        result.result.map((e) => QuestionModel.fromJson(json.decode(e))));
    return Result(result: questionList);
  }
}
