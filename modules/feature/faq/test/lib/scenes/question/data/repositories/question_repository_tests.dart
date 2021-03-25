import 'dart:convert';
import 'package:FAQ/scenes/questions/data/models/questions_service_error.dart';
import 'package:FAQ/scenes/questions/data/repositories/questions_repository.dart';
import 'package:FAQ/scenes/questions/data/services/questions_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:models/models/question_model.dart';
import 'package:foundation/generics/result.dart';
import 'package:testing_tools/mocks/generic_app_module_fake.dart';

void testQuestionRepository() {
  group('DefaultQuestionRepository fetchQuestions()', () {
    final serviceStub = QuestionServiceStub();
    final fakeModule = GenericAppModuleFake(serviceStub);
    fakeModule.load(isLoadDependency: false);
    final sut = DefaultQuestionRepository();
    final dummyString = 'dummy';

    test('When service returns error it should return an result with an error',
        () async {
      //Given
      final listToUse = null;
      serviceStub.listToUse = listToUse;
      //When
      final result = await sut.fetchQuestions(dummyString);
      //Then
      expect(result.result, null);
      expect(result.error, isNot(null));
    });

    test('When service succeeds it should return an result with a value',
        () async {
      //Given
      final questionModelList = [
        QuestionModel().toJson(),
        QuestionModel().toJson(),
        QuestionModel().toJson()
      ];
      final listToUse = [
        json.encode(questionModelList[0]),
        json.encode(questionModelList[1]),
        json.encode(questionModelList[2]),
      ];
      serviceStub.listToUse = listToUse;

      //When
      final result = await sut.fetchQuestions(dummyString);
      //Then
      expect(result.result, isNot(null));
      expect(result.error, null);
    });
  });
}

class QuestionServiceStub implements QuestionService {
  List<String> listToUse;

  @override
  Future<Result<List<String>, QuestionServiceError>> fetchQuestions(
      String query) async {
    return Result(result: listToUse);
  }
}
