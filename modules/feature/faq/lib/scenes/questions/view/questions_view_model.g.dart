// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DefaultQuestionViewModel on DefaultQuestionViewModelBase, Store {
  final _$questionListAtom =
      Atom(name: 'DefaultQuestionViewModelBase.questionList');

  @override
  List<QuestionModel> get questionList {
    _$questionListAtom.reportRead();
    return super.questionList;
  }

  @override
  set questionList(List<QuestionModel> value) {
    _$questionListAtom.reportWrite(value, super.questionList, () {
      super.questionList = value;
    });
  }

  @override
  String toString() {
    return '''
questionList: ${questionList}
    ''';
  }
}
