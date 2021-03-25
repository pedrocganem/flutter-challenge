import 'package:FAQ/scenes/questions/data/models/question_repository_error.dart';
import 'package:FAQ/scenes/questions/data/repositories/questions_repository.dart';
import 'package:FAQ/scenes/questions/domain/fetch_question_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:models/models/question_model.dart';
import 'package:foundation/generics/result.dart';
import 'package:testing_tools/mocks/generic_app_module_fake.dart';

void testFetchQuestionsUseCase() {
  group('DefaultFetchQuestionsUseCase fetchQuestion()', () {
    final repositoryStub = QuestionRepositoryStub();
    final fakeModule = GenericAppModuleFake(repositoryStub);
    fakeModule.load(isLoadDependency: false);
    final sut = DefaultFetchQuestionsUseCase();
    final dummyString = 'dummy';

    test('when service returns error it should return a result with an error',
        () async {
      //Given
      final listToUse = null;
      repositoryStub.listToUse = listToUse;
      //When
      final result = await sut.fetchQuestions(dummyString);
      //Then
      expect(result.result, null);
      expect(result.error, isNot(null));
    });

    test('when service succeeds it should return a result with an value',
        () async {
      //Given
      final listToUse = [QuestionModel()];
      repositoryStub.listToUse = listToUse;
      //When
      final result = await sut.fetchQuestions(dummyString);
      //Then
      expect(result.result, isNot(null));
      expect(result.error, null);
    });
  });
}

class QuestionRepositoryStub implements QuestionRepository {
  List<QuestionModel> listToUse;

  @override
  Future<Result<List<QuestionModel>, QuestionRepositoryError>> fetchQuestions(
      String query) async {
    return Result(result: listToUse);
  }
}
