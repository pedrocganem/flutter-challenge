import 'dart:convert';
import 'package:FAQ/questions/data/models/question_model.dart';
import 'package:FAQ/questions/data/models/question_repository_error.dart';
import 'package:FAQ/questions/data/services/questions_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:foundation/generics/result.dart';

abstract class QuestionRepository {
  Future<Result<List<QuestionModel>, QuestionRepositoryError>> fetchQuestions(
      String referenceKey);
  Future<Result<bool, QuestionRepositoryError>> storeQuestion(
      String referenceKey, String valueToStore);
}

class DefaultQuestionRepository implements QuestionRepository {
  final _service = Modular.get<QuestionService>();

  @override
  Future<Result<List<QuestionModel>, QuestionRepositoryError>> fetchQuestions(
      String referenceKey) async {
    final result = await _service.fetchQuestions(referenceKey);
    if (result.error != null)
      return Result(error: QuestionRepositoryError.serviceError);
    final decodedJson = json.decode(result.result);
    final questionList = List<QuestionModel>.from(
        decodedJson.map((e) => QuestionModel.fromJson(e)));
    return Result(result: questionList);
  }

  @override
  Future<Result<bool, QuestionRepositoryError>> storeQuestion(
      String referenceKey, String valueToStore) {
   
  }
}
