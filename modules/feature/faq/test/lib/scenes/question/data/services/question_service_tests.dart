import 'package:FAQ/scenes/questions/data/services/questions_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_tools/mocks/generic_app_module_fake.dart';

import '../../../../mocks/question_database_mock.dart';

void testQuestionService() {
  group("LocalQuestionsService fetchQuestions()", () {
    final hiveStub = QuestionDatabaseMock();
    final fakeModule = GenericAppModuleFake(hiveStub);
    fakeModule.load(isLoadDependency: false);
    final dummyString = 'dummy';
    final sut = LocalQuestionsService();

    test("When localDB returns null it should return a result with an error",
        () async {
      //Given
      final listToUse = null;
      hiveStub.listToUse = listToUse;
      //When
      final result = await sut.fetchQuestions(dummyString);
      //Then
      expect(result.result, null);
      expect(result.error, isNot(null));
    });

    test("When localDB succeeds it should return a result with a value",
        () async {
      //Given
      final listToUse = [dummyString];
      hiveStub.listToUse = listToUse;
      //When
      final result = await sut.fetchQuestions(dummyString);
      //Then
      expect(result.result, isNot(null));
      expect(result.error, null);
    });
  });
}
