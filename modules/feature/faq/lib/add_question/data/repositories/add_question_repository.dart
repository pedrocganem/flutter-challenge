import 'dart:convert';

import 'package:FAQ/add_question/data/models/add_question_repository_error.dart';
import 'package:FAQ/add_question/data/service/add_question_service.dart';
import 'package:FAQ/questions/data/models/question_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:foundation/generics/result.dart';

abstract class AddQuestionRepository {
  Future<Result<bool, AddQuestionRepositoryError>> storeQuestion(String referenceKey, QuestionModel questionToStore);
}


class DefaultAddQuestionRepository implements AddQuestionRepository {

  final _service = Modular.get<AddQuestionService>();

  @override
  Future<Result<bool, AddQuestionRepositoryError>> storeQuestion(String referenceKey, QuestionModel questionToStore) async {
   final json = questionToStore.toJson();
  final valueToStore = jsonEncode(json);
  final result = await _service.storeQuestion(referenceKey, valueToStore);
  if (result.error != null)
    return Result(error: AddQuestionRepositoryError.serviceError);
  return Result(result: true);
  }
}
