import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash_screen/scenes/splash_screen/view/splash_screen_view.dart';
import 'package:splash_screen/scenes/splash_screen/view/splash_screen_view_model.dart';
import 'package:testing_tools/mocks/generic_app_module_fake.dart';
import 'package:testing_tools/utils/ui/ui.dart';


void testSplashScreenView() {
  final viewModelStub = SplashScreenViewModelStub();
  final fakeModule = GenericAppModuleFake(viewModelStub);
  fakeModule.load(isLoadDependency: false);
  testWidgets("splashScreen", (WidgetTester tester) async {
    await tester.setScreenSize(height: 960, width: 540);
    await tester.pumpWidget(UIUtils.makeTestable(SplashScreenView()));

    expect(find.byType(SplashScreenView),
        findsOneWidget);
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

class SplashScreenViewModelStub implements SplashScreenViewModel {
  @override
  viewDidLoad() {}
}
