import 'package:flutter_test/flutter_test.dart';
import 'package:local_database/local_database/hive/abstract_hive.dart';
import 'package:local_database/local_database/shared_preferences/abstract_shared_preferences.dart';
import 'package:splash_screen/scenes/splash_screen/data/services/splash_screen_service.dart';
import 'package:testing_tools/mocks/generic_app_module_fake.dart';

void testSplashScreenService() {
  group('LocalSplashScreenService', () {
    final dependenciesStub = DependenciesStub();
    final fakeAppModule = GenericAppModuleFake(dependenciesStub);
    fakeAppModule.load(isLoadDependency: false);
    final sut = LocalSplashScreenService();
    final dummyString = 'dummy';

    test('when isFirstLaunch succeeds it should return true', () async {
      //Given
      final boolToUse = true;
      dependenciesStub.boolToUse = boolToUse;
      //When
      final result = await sut.isFirstLaunch();
      //Then
      expect(result, true);
    });

    test('when isFirstLaunch fails it should return false', () async {
      //Given
      final boolToUse = false;
      dependenciesStub.boolToUse = boolToUse;
      //When
      final result = await sut.isFirstLaunch();
      //Then
      expect(result, false);
    });

    test('when setFirstLaunch is called it should store true', () async {
      //When
      await sut.setFirstLaunch();
      //Then
      expect(dependenciesStub.setFirstLaunchCalledCount, 1);
    });

    test('when createQuestion is called it should store a question', () async {
      //When
      await sut.createQuestion(dummyString);
      //Then
      expect(dependenciesStub.createQuestionCalledCount, 1);
    });
  });
}

class DependenciesStub implements QuestionDatabase, SharedPreferencesWrapper {
  String createQuestionQuestionPassed;
  int createQuestionCalledCount = 0;
  int setFirstLaunchCalledCount = 0;
  bool boolToUse;
  @override
  createQuestion(String question) {
    createQuestionCalledCount += 1;
    createQuestionQuestionPassed = question;
  }

  @override
  Future<List> fetchQuestions(String query) {
    throw UnimplementedError(
        'This is not implemented for this method, please consider reviewing your code');
  }

  @override
  Future<bool> isFirstLaunch() async {
    return boolToUse;
  }

  @override
  setFirstLaunch() {
    setFirstLaunchCalledCount += 1;
  }
}
