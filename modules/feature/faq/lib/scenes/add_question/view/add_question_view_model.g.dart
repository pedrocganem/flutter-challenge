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

  final _$titleAtom = Atom(name: '_AddQuestionViewModelBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$contentAtom = Atom(name: '_AddQuestionViewModelBase.content');

  @override
  String get content {
    _$contentAtom.reportRead();
    return super.content;
  }

  @override
  set content(String value) {
    _$contentAtom.reportWrite(value, super.content, () {
      super.content = value;
    });
  }

  final _$selectedColorIndexAtom =
      Atom(name: '_AddQuestionViewModelBase.selectedColorIndex');

  @override
  int get selectedColorIndex {
    _$selectedColorIndexAtom.reportRead();
    return super.selectedColorIndex;
  }

  @override
  set selectedColorIndex(int value) {
    _$selectedColorIndexAtom.reportWrite(value, super.selectedColorIndex, () {
      super.selectedColorIndex = value;
    });
  }

  final _$onAddButtonPressedAsyncAction =
      AsyncAction('_AddQuestionViewModelBase.onAddButtonPressed');

  @override
  Future onAddButtonPressed() {
    return _$onAddButtonPressedAsyncAction
        .run(() => super.onAddButtonPressed());
  }

  final _$_AddQuestionViewModelBaseActionController =
      ActionController(name: '_AddQuestionViewModelBase');

  @override
  dynamic onTitleChange(String newValue) {
    final _$actionInfo = _$_AddQuestionViewModelBaseActionController
        .startAction(name: '_AddQuestionViewModelBase.onTitleChange');
    try {
      return super.onTitleChange(newValue);
    } finally {
      _$_AddQuestionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onContentChange(String newValue) {
    final _$actionInfo = _$_AddQuestionViewModelBaseActionController
        .startAction(name: '_AddQuestionViewModelBase.onContentChange');
    try {
      return super.onContentChange(newValue);
    } finally {
      _$_AddQuestionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onColorChosen(int index) {
    final _$actionInfo = _$_AddQuestionViewModelBaseActionController
        .startAction(name: '_AddQuestionViewModelBase.onColorChosen');
    try {
      return super.onColorChosen(index);
    } finally {
      _$_AddQuestionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
content: ${content},
selectedColorIndex: ${selectedColorIndex},
isButtonEnabled: ${isButtonEnabled}
    ''';
  }
}
