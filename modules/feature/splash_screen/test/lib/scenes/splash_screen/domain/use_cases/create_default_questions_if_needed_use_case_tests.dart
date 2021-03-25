import 'package:flutter_test/flutter_test.dart';
import 'package:models/models/question_model.dart';
import 'package:splash_screen/scenes/splash_screen/data/repositories/splash_screen_repository.dart';
import 'package:splash_screen/scenes/splash_screen/domain/use_cases/create_default_question_if_needed_use_case.dart';
import 'package:testing_tools/mocks/generic_app_module_fake.dart';

void testCreateDefaultQuestionsIfNeededUseCase() {
  group('DefaultCreateDefaultQuestionsIfNeededUseCase', () {
    final repositoryMock = SplashScreenRepositoryMock();
    final fakeModule = GenericAppModuleFake(repositoryMock);
    fakeModule.load(isLoadDependency: false);
    final sut = DefaultCreateDefaultQuestionsIfNeededUseCase();

    test('when isFirstLaunch returns false it should not setFirstLaunch', () async {
      //Given
      final boolToUse = false;
      repositoryMock.boolToUse = boolToUse; 
      //When
      await sut.execute();
      //Then
      expect(repositoryMock.setFirstLaunchCalledCount, 0);
      expect(repositoryMock.createQuestionCalledCount, 0);
    }); 

    test('when isFirstLaunch returns true it should setFirstLaunch once and createQuestion 10 times', () async {
      //Given
      final boolToUse = true;
      repositoryMock.boolToUse = boolToUse;
      //When
      await sut.execute();
      //Then
      expect(repositoryMock.createQuestionCalledCount, 10);
      expect(repositoryMock.setFirstLaunchCalledCount, 1);

    });
  });
}

class SplashScreenRepositoryMock implements SplashScreenRepository {
  int createQuestionCalledCount = 0;
  int setFirstLaunchCalledCount = 0;
  bool boolToUse;

  @override
  createQuestion(QuestionModel question) {
    createQuestionCalledCount += 1;
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
