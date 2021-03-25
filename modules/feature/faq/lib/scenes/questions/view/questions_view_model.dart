import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:foundation/foundation.dart';
import '../domain/fetch_question_use_case.dart';
import 'package:models/models.dart';
import 'package:mobx/mobx.dart';
part 'questions_view_model.g.dart';

abstract class QuestionViewModel {
  //Methods
  fetchQuestions();
  Color convertCardColor(String hexColor);
  bool toggleSearchBar();
  onExitSearchMode();
  searchInputDidChange(String newValue);
  onAddButtonPressed(ScaffoldState state);
  bool get isLoadingComplete;

  //Observables
  bool isSearchBarEnabled;
  ObservableList<QuestionModel> questionList;
  String searchKeyword;
}

class DefaultQuestionViewModel = DefaultQuestionViewModelBase
    with _$DefaultQuestionViewModel;

abstract class DefaultQuestionViewModelBase
    with Store
    implements QuestionViewModel {
  final _useCase = Modular.get<FetchQuestionsUseCase>();

  @observable
  ObservableList<QuestionModel> questionList;

  @observable
  String searchKeyword = '';

  @observable
  bool isSearchBarEnabled = false;

  @action
  searchInputDidChange(String newValue) {
    searchKeyword = newValue;
    fetchQuestions();
  }

  @action
  bool toggleSearchBar() => isSearchBarEnabled = !isSearchBarEnabled;

  @action
  onExitSearchMode() {
    searchKeyword = '';
    fetchQuestions();
  }

  @computed
  bool get isSearchMode => isSearchBarEnabled;

  @computed
  bool get isLoadingComplete => questionList != null;

  fetchQuestions() async {
    final result = await _useCase.fetchQuestions(searchKeyword);
    questionList = result.result.asObservable();
  }

  Color convertCardColor(String hexColor) {
    return Color(int.parse('0x$hexColor'));
  }

  onAddButtonPressed(ScaffoldState state) {
    Modular.to
        .pushNamed(
            AppRoutes.ROUTE_QUESTIONS_VIEW + AppRoutes.ROUTE_ADD_QUESTION_VIEW)
        .then((value) {
      fetchQuestions();
      final snackBar = SnackBar(
          content: ListTile(
        dense: true,
        leading: Icon(Icons.check_circle_rounded, color: Colors.white),
        title: Text('Pergunta adicionada com sucesso'),
      ));
      state.showSnackBar(snackBar);
    });
  }
}
