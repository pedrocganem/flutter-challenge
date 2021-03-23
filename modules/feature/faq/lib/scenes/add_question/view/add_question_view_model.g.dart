// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_question_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddQuestionViewModel on _AddQuestionViewModelBase, Store {
  Computed<bool> _$isButtonEnabledComputed;

  @override
  bool get isButtonEnabled =>
      (_$isButtonEnabledComputed ??= Computed<bool>(() => super.isButtonEnabled,
              name: '_AddQuestionViewModelBase.isButtonEnabled'))
          .value;

  final _$questionAtom = Atom(name: '_AddQuestionViewModelBase.question');

  @override
  QuestionModel get question {
    _$questionAtom.reportRead();
    return super.question;
  }

  @override
  set question(QuestionModel value) {
    _$questionAtom.reportWrite(value, super.question, () {
      super.question = value;
    });
  }

  final _$onAddButtonPressedAsyncAction =
      AsyncAction('_AddQuestionViewModelBase.onAddButtonPressed');

  @override
  Future onAddButtonPressed(String title, String content, String hexColor) {
    return _$onAddButtonPressedAsyncAction
        .run(() => super.onAddButtonPressed(title, content, hexColor));
  }

  @override
  String toString() {
    return '''
question: ${question},
isButtonEnabled: ${isButtonEnabled}
    ''';
  }
}
