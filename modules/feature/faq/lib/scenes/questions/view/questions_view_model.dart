import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../domain/fetch_question_use_case.dart';
import 'package:models/models.dart';

abstract class QuestionViewModel {
  fetchQuestions(Function(List<QuestionModel>) callback);
  onAddButtonPressed();
  onSearchButtonPressed();
}

class DefaultQuestionViewModel implements QuestionViewModel {
  final _useCase = Modular.get<FetchQuestionsUseCase>();

  @override
  fetchQuestions(Function(List<QuestionModel>) callback) async {
    final result = await _useCase.fetchQuestions('');
    callback(result.result);
  }

  @override
  void onAddButtonPressed() {
    // TODO: implement onAddButtonPressed
    //TODO: implement navigation to AddQuestionView
  }

  @override
  void onSearchButtonPressed() {
    // TODO: implement onSearchButtonPressed
  }
}
