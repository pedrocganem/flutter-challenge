import 'dart:convert';

import 'package:FAQ/scenes/add_question/data/repositories/add_question_repository.dart';
import 'package:FAQ/scenes/add_question/data/service/add_question_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:models/models/question_model.dart';
import 'package:testing_tools/mocks/generic_app_module_fake.dart';

void testAddQuestionRepository() {
  group('DefaultAddQuestionRepository storeQuestion()', () {
    final serviceSpy = AddQuestionServiceSpy();
    final fakeModule = GenericAppModuleFake(serviceSpy);
    fakeModule.load(isLoadDependency: false);
    final sut = DefaultAddQuestionRepository();
    final dummyString = 'dummy';
    test('when storeQuestion is called it should store in database', () async {
      //Given
      final questionToStore = QuestionModel(
          content: dummyString, title: dummyString, hexColor: dummyString);
      //When
      await sut.storeQuestion(questionToStore);
      //Then
      expect(serviceSpy.storeQuestionCalledCount, 1);
      expect(serviceSpy.storeQuestionQuestionToStorePassed,
          json.encode(questionToStore.toJson()));
    });
  });
}

class AddQuestionServiceSpy implements AddQuestionService {
  int storeQuestionCalledCount = 0;
  String storeQuestionQuestionToStorePassed;

  @override
  storeQuestion(String questionToStore) {
    storeQuestionCalledCount += 1;
    storeQuestionQuestionToStorePassed = questionToStore;
  }
}
