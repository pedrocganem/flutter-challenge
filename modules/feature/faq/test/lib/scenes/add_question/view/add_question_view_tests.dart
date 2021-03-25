import 'dart:ui';

import 'package:FAQ/scenes/add_question/view/add_question_view.dart';
import 'package:FAQ/scenes/add_question/view/add_question_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_tools/mocks/generic_app_module_fake.dart';
import 'package:testing_tools/utils/ui/ui.dart';

void testAddQuestionView() {
  final viewModelStub = AddQuestionViewModelStub();
  final fakeModule =
      GenericAppModuleFake<AbstractAddQuestionViewModel>(viewModelStub);
  fakeModule.load(isLoadDependency: false);
  testWidgets("AddQuestionView when fields are not valid",
      (WidgetTester tester) async {
    await tester.setScreenSize(height: 960, width: 540);
    viewModelStub.selectedColorIndex = null;
    viewModelStub.content = '';
    viewModelStub.title = '';
    await tester.pumpWidget(UIUtils.makeTestable(AddQuestionView()));
    expect(
        find.byType(AddQuestionView),
        matchesGoldenFile(
            "snapshot/add_question_view_when_fields_are_not_valid.png"));
  });
  testWidgets("AddQuestionView when fields are valid",
      (WidgetTester tester) async {
    await tester.setScreenSize(height: 960, width: 540);
    viewModelStub.selectedColorIndex = 0;
    viewModelStub.title = 'dummy';
    viewModelStub.content = 'dummy';
    await tester.pumpWidget(UIUtils.makeTestable(AddQuestionView()));
    expect(
        find.byType(AddQuestionView),
        matchesGoldenFile(
            "snapshot/add_question_view_when_fields_are_valid.png"));
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

class AddQuestionViewModelStub implements AbstractAddQuestionViewModel {
  @override
  List<String> hexColorList = ['FF46C9A7', 'FFFF7074', 'FFFFBE00', 'FF10159A'];

  @override
  int selectedColorIndex;

  @override
  Color colorAtIndex(int index) {
    final color = hexColorList[index];
    final hexCode = int.parse('0x$color');
    return Color(hexCode);
  }

  @override
  bool get isButtonEnabled =>
      selectedColorIndex != null && title != '' && content != '';

  @override
  bool isColorSelected(int index) => false;

  @override
  onAddButtonPressed() {}

  @override
  onColorChosen(int index) {}

  @override
  onContentChange(String newValue) {}

  @override
  onTitleChange(String newValue) {}

  @override
  String content;

  @override
  String title;
}
