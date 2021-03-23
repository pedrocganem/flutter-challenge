import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../domain/fetch_question_use_case.dart';
import 'package:models/models.dart';
import 'package:mobx/mobx.dart';
part 'questions_view_model.g.dart';

class DefaultQuestionViewModel = DefaultQuestionViewModelBase
    with _$DefaultQuestionViewModel;

abstract class DefaultQuestionViewModelBase with Store {
  final _useCase = Modular.get<FetchQuestionsUseCase>();

  @observable
  ObservableList<QuestionModel> questionList = [QuestionModel(title: 'a', content: 'b', cardColor: Colors.green)].asObservable();

  fetchQuestions() async {
    final result = await _useCase.fetchQuestions('');
    print(result.result);
  }

  void onAddButtonPressed() {
    // TODO: implement onAddButtonPressed
    //TODO: implement navigation to AddQuestionView
  }

  void onSearchButtonPressed() {
    // TODO: implement onSearchButtonPressed
  }
}
