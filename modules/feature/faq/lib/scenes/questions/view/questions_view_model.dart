import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:foundation/foundation.dart';
import '../domain/fetch_question_use_case.dart';
import 'package:models/models.dart';
import 'package:mobx/mobx.dart';
part 'questions_view_model.g.dart';

class DefaultQuestionViewModel = DefaultQuestionViewModelBase
    with _$DefaultQuestionViewModel;

abstract class DefaultQuestionViewModelBase with Store {
  final _useCase = Modular.get<FetchQuestionsUseCase>();

  @observable
  List<QuestionModel> questionList = [];

  fetchQuestions() async {
    final result = await _useCase.fetchQuestions('');
    questionList = result.result;
  }

  Color convertCardColor(String hexColor) {
    return Color(int.parse('0x$hexColor'));
  }

  void onAddButtonPressed(ScaffoldState state) {
    Modular.to
        .pushNamed(
            AppRoutes.ROUTE_QUESTIONS_VIEW + AppRoutes.ROUTE_ADD_QUESTION_VIEW)
        .then((value) {
      fetchQuestions();
      final snackBar = SnackBar(content: Text('SALVE VOLTEI CARAI'));
      state.showSnackBar(snackBar);
    });
  }

  void onSearchButtonPressed() {
    // TODO: implement onSearchButtonPressed
  }
}
