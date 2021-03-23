import 'dart:convert';
import 'package:FAQ/scenes/add_question/data/models/add_question_repository_error.dart';
import 'package:FAQ/scenes/add_question/data/service/add_question_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:foundation/generics/result.dart';
import 'package:models/models/question_model.dart';

abstract class AddQuestionRepository {
  Future<Result<bool, AddQuestionRepositoryError>> storeQuestion(QuestionModel question);
}


class DefaultAddQuestionRepository implements AddQuestionRepository {

  final _service = Modular.get<AddQuestionService>();

  @override
  Future<Result<bool, AddQuestionRepositoryError>> storeQuestion(QuestionModel question) async {
   final json = question.toJson();
  final valueToStore = jsonEncode(json);
  final result = await _service.storeQuestion(valueToStore);
  if (result.error != null)
    return Result(error: AddQuestionRepositoryError.serviceError);
  return Result(result: true);
  }
}
