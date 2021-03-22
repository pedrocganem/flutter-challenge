import 'package:FAQ/questions/data/models/question_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../data/models/question_model.dart';
import '../domain/fetch_question_use_case.dart';

abstract class QuestionViewModel {
  fetchQuestions();
  onAddButtonPressed();
  onSearchButtonPressed();
}

class DefaultQuestionViewModel implements QuestionViewModel {
  final _useCase = Modular.get<FetchQuestionsUseCase>();

  List<QuestionModel> questionList;

  @override
  fetchQuestions() async {
    final result = await _useCase.fetchQuestions();
    questionList = result.result;
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
