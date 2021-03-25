import 'package:FAQ/scenes/add_question/data/repositories/add_question_repository.dart';
import 'package:FAQ/scenes/add_question/domain/use_cases/add_question_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:models/models/question_model.dart';
import 'package:testing_tools/mocks/generic_app_module_fake.dart';

void testAddQuestionUseCase() {
  group('DefaultAddQuestionUseCase storeQuestion()', () {
    final repositorySpy = AddQuestionRepositorySpy();
    final fakeModule = GenericAppModuleFake(repositorySpy);
    fakeModule.load(isLoadDependency: false);
    final sut = DefaultAddQuestionUseCase();
    final dummyString = 'dummy';

    test('when repository succeeds it should store a question', () async {
      //Given
      final questionToStore = QuestionModel(
          title: dummyString, content: dummyString, hexColor: dummyString);
      //When
      await sut.storeQuestion(questionToStore.hexColor, questionToStore.title,
          questionToStore.content);
      //Then
      expect(repositorySpy.storeQuestionCalledCount, 1);
      expect(repositorySpy.storeQuestionQuestionPassed.title, dummyString);
      expect(repositorySpy.storeQuestionQuestionPassed.content, dummyString);
      expect(repositorySpy.storeQuestionQuestionPassed.hexColor, dummyString);
    });
  });
}

class AddQuestionRepositorySpy implements AddQuestionRepository {
  int storeQuestionCalledCount = 0;
  QuestionModel storeQuestionQuestionPassed;
  @override
  storeQuestion(QuestionModel question) {
    storeQuestionCalledCount += 1;
    storeQuestionQuestionPassed = question;
  }
}
