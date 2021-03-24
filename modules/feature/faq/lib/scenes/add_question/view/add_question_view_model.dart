import 'package:FAQ/scenes/add_question/domain/use_cases/add_question_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'add_question_view_model.g.dart';

class AddQuestionViewModel = _AddQuestionViewModelBase
    with _$AddQuestionViewModel;

abstract class _AddQuestionViewModelBase with Store {
  final _useCase = Modular.get<AddQuestionUseCase>();

  List<String> hexColorList = ['FF46C9A7', 'FFFF7074', 'FFFFBE00', 'FF10159A'];

  @observable
  String title;

  @observable
  String content;

  @observable
  int selectedColorIndex;

  @action
  onTitleChange(String newValue) => title = newValue;

  @action
  onContentChange(String newValue) => content = newValue;

 
  onColorChosen(int index) {
    selectedColorIndex = index;
  }

  onAddButtonPressed() async {
    final hexColor = hexColorList[selectedColorIndex];
    await _useCase.storeQuestion(hexColor, title, content);
    Modular.to.pop();
  }

  Color colorAtIndex(int index) {
    final color = hexColorList[index];
    final hexCode = int.parse('0x$color');
    return Color(hexCode);
  }

  
  bool isColorSelected(int index) => index == selectedColorIndex;

  @computed
  bool get isButtonEnabled =>
      selectedColorIndex != null &&
      title != null &&
      content != null;
}
