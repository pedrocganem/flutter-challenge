import 'package:flutter_test/flutter_test.dart';
import 'package:models/models/question_model.dart';
import 'package:splash_screen/scenes/splash_screen/data/repositories/splash_screen_repository.dart';
import 'package:splash_screen/scenes/splash_screen/data/services/splash_screen_service.dart';
import 'package:testing_tools/mocks/generic_app_module_fake.dart';

void testSplashScreenRepository() {
  group('LocalSplashScreenService', () {
    final serviceMock = LocalSplashScreenServiceMock();
    final fakeModule = GenericAppModuleFake(serviceMock);
    fakeModule.load(isLoadDependency: false);
    final sut = DefaultSplashScreenRepository();
    final dummyString = 'dummy';

    test('when isFirstLaunch succeeds it should return true', () async {
      //Given
      final boolToUse = true;
      serviceMock.boolToUse = boolToUse;
      //When
      final result = await sut.isFirstLaunch();
      //Then
      expect(result, true);
    });

    test('when isFirstLaunch fails it should return false', () async {
      //Given
      final boolToUse = false;
      serviceMock.boolToUse = boolToUse;
      //When
      final result = await sut.isFirstLaunch();
      //Then
      expect(result, false);
    });

    test('when setFirstLaunch is called it should store true', () async {
      //When
      await sut.setFirstLaunch();
      //Then
      expect(serviceMock.setFirstLaunchCalledCount, 1);
    });

    test('when createQuestion is called it should store a question', () async {
      //Given
      final questionToUse = QuestionModel(
          title: dummyString, content: dummyString, hexColor: dummyString);
      //When
      await sut.createQuestion(questionToUse);
      //Then
      expect(serviceMock.createQuestionCalledCount, 1);
    });
  });
}

class LocalSplashScreenServiceMock implements SplashScreenService {
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
  Future<bool> isFirstLaunch() async {
    return boolToUse;
  }

  @override
  setFirstLaunch() {
    setFirstLaunchCalledCount += 1;
  }
}
