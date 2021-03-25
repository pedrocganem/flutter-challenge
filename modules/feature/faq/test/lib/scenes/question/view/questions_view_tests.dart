import 'dart:ui';
import 'package:FAQ/scenes/questions/view/questions_view.dart';
import 'package:FAQ/scenes/questions/view/questions_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:models/models/question_model.dart';
import 'package:testing_tools/mocks/generic_app_module_fake.dart';
import 'package:testing_tools/utils/ui/ui.dart';

void testQuestionView() {
  final viewModelStub = QuestionViewModelStub();
  final fakeModule = GenericAppModuleFake<QuestionViewModel>(viewModelStub);
  fakeModule.load(isLoadDependency: false);
  testWidgets("QuestionView when one card is opened and searchBar is hidden",
      (WidgetTester tester) async {
    await tester.setScreenSize(height: 960, width: 540);
    await tester.pumpWidget(UIUtils.makeTestable(QuestionsView()));
    await tester.tap(find.byType(ExpansionTile).first);
    await tester.pumpAndSettle();

    expect(
        find.byType(QuestionsView),
        matchesGoldenFile(
            "snapshot/questions_view_when_search_bar_is_hidden.png"));
  });
  testWidgets("s when one card is opened and searchBar is visible",
      (WidgetTester tester) async {
    await tester.setScreenSize(height: 960, width: 540);
    viewModelStub.isSearchBarEnabled = true;
    await tester.pumpWidget(UIUtils.makeTestable(QuestionsView()));
    await tester.tap(find.byType(ExpansionTile).first);
    await tester.pumpAndSettle();
    expect(find.byType(QuestionsView),
        matchesGoldenFile("snapshot/questions_view_when_search_bar_is_opened.png"));
  });
}

extension SetScreenSize on WidgetTester {
  Future<void> setScreenSize(
      {double width = 540,
      double height = 960,
      double pixelDensity = 1}) async {
    final size = Size(width, height);
    await this.binding.setSurfaceSize(size);
    this.binding.window.physicalSizeTestValue = size;
    this.binding.window.devicePixelRatioTestValue = pixelDensity;
  }
}

class QuestionViewModelStub implements QuestionViewModel {
  @override
  bool isSearchBarEnabled = false;

  @override
  ObservableList<QuestionModel> questionList = [
    QuestionModel(
        title: 'This card is closed',
        hexColor: "FF46C9A7",
        content: 'This should not appear'),
    QuestionModel(
        title: 'This card is opened',
        hexColor: "FFFF7074",
        content: 'This should appear')
  ].asObservable();

  @override
  String searchKeyword = '';

  @override
  Color convertCardColor(String hexColor) {
    return Color(int.parse('0x$hexColor'));
  }

  @override
  fetchQuestions() {}

  @override
  bool get isLoadingComplete => true;

  @override
  onAddButtonPressed(ScaffoldState state) {}

  @override
  onExitSearchMode() {
    throw UnimplementedError();
  }

  @override
  searchInputDidChange(String newValue) {}

  @override
  bool toggleSearchBar() => null;
}
