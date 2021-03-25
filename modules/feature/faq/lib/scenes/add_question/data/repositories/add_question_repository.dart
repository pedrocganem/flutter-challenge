import 'dart:convert';
import 'package:FAQ/scenes/add_question/data/service/add_question_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/models/question_model.dart';

abstract class AddQuestionRepository {
  storeQuestion(QuestionModel question);
}


class DefaultAddQuestionRepository implements AddQuestionRepository {
  final _service = Modular.get<AddQuestionService>();

  @override
  storeQuestion(QuestionModel question) async {
  final json = question.toJson();
  final valueToStore = jsonEncode(json);
  await _service.storeQuestion(valueToStore);
  }
}
