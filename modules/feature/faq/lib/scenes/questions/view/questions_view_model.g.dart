// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DefaultQuestionViewModel on DefaultQuestionViewModelBase, Store {
  Computed<bool> _$isSearchModeComputed;

  @override
  bool get isSearchMode =>
      (_$isSearchModeComputed ??= Computed<bool>(() => super.isSearchMode,
              name: 'DefaultQuestionViewModelBase.isSearchMode'))
          .value;

  final _$questionListAtom =
      Atom(name: 'DefaultQuestionViewModelBase.questionList');

  @override
  ObservableList<QuestionModel> get questionList {
    _$questionListAtom.reportRead();
    return super.questionList;
  }

  @override
  set questionList(ObservableList<QuestionModel> value) {
    _$questionListAtom.reportWrite(value, super.questionList, () {
      super.questionList = value;
    });
  }

  final _$searchKeywordAtom =
      Atom(name: 'DefaultQuestionViewModelBase.searchKeyword');

  @override
  String get searchKeyword {
    _$searchKeywordAtom.reportRead();
    return super.searchKeyword;
  }

  @override
  set searchKeyword(String value) {
    _$searchKeywordAtom.reportWrite(value, super.searchKeyword, () {
      super.searchKeyword = value;
    });
  }

  final _$isSearchBarEnabledAtom =
      Atom(name: 'DefaultQuestionViewModelBase.isSearchBarEnabled');

  @override
  bool get isSearchBarEnabled {
    _$isSearchBarEnabledAtom.reportRead();
    return super.isSearchBarEnabled;
  }

  @override
  set isSearchBarEnabled(bool value) {
    _$isSearchBarEnabledAtom.reportWrite(value, super.isSearchBarEnabled, () {
      super.isSearchBarEnabled = value;
    });
  }

  final _$DefaultQuestionViewModelBaseActionController =
      ActionController(name: 'DefaultQuestionViewModelBase');

  @override
  dynamic searchInputDidChange(String newValue) {
    final _$actionInfo = _$DefaultQuestionViewModelBaseActionController
        .startAction(name: 'DefaultQuestionViewModelBase.onInputSearchKeyword');
    try {
      return super.searchInputDidChange(newValue);
    } finally {
      _$DefaultQuestionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool toggleSearchBar() {
    final _$actionInfo = _$DefaultQuestionViewModelBaseActionController
        .startAction(name: 'DefaultQuestionViewModelBase.toggleSearchBar');
    try {
      return super.toggleSearchBar();
    } finally {
      _$DefaultQuestionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
questionList: ${questionList},
searchKeyword: ${searchKeyword},
isSearchBarEnabled: ${isSearchBarEnabled},
isSearchMode: ${isSearchMode}
    ''';
  }
}
