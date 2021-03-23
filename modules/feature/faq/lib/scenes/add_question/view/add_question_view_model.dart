import 'package:FAQ/scenes/add_question/domain/use_cases/add_question_use_case.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/models/question_model.dart';
part 'add_question_view_model.g.dart';

class AddQuestionViewModel = _AddQuestionViewModelBase with _$AddQuestionViewModel;

abstract class _AddQuestionViewModelBase with Store {

  final _useCase = Modular.get<AddQuestionUseCase>();

  @observable
  QuestionModel question;

  @action
  onTitleChange(String newValue) => question.title = newValue;

  @action
  onContentChange(String newValue) => question.content = newValue;

  @action
  onColorChosen(String newValue) => question.hexColor = newValue;
  
  @action 
  onAddButtonPressed(String title, String content, String hexColor) async {
    await _useCase.storeQuestion(question.hexColor, question.title, question.content);
    //TODO navigate to previous screen 
  }

  @computed
  bool get isButtonEnabled => question.hexColor != null &&  question.title != null && question.content != null;
}