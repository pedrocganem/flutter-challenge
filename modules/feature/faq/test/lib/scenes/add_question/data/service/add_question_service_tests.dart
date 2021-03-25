import 'package:FAQ/scenes/add_question/data/service/add_question_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_tools/mocks/generic_app_module_fake.dart';
import '../../../../mocks/question_database_mock.dart';

void testAddQuestionService() {
  group('DefaultAddQuestionService storeQuestion()', () {
    final databaseSpy = QuestionDatabaseMock();
    final fakeModule = GenericAppModuleFake(databaseSpy);
    fakeModule.load(isLoadDependency: false);
    final sut = DefaultAddQuestionService();
    final dummyString = 'dummy';

    test('when createQuestion is called it should store in database', () async {
      //When
      await sut.storeQuestion(dummyString);
      //Then
      expect(databaseSpy.createQuestionCalledCount, 1);
      expect(databaseSpy.createQuestionQuestionPassed, dummyString);
    });
  });
}
