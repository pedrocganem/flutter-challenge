import 'package:FAQ/add_question/data/models/add_question_service_error.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:foundation/generics/result.dart';
import 'package:local_database/local_database/local_database_handler.dart';

abstract class AddQuestionService {
  Future<Result<bool, AddQuestionServiceError>> storeQuestion(String referenceKey, String questionToStore);
}


class DefaultAddQuestionService implements AddQuestionService {

  final _localDB = Modular.get<LocalDatabaseHandler>();

  @override
  Future<Result<bool, AddQuestionServiceError>> storeQuestion(String referenceKey, String questionToStore) async {
    final result = await _localDB.storeQuestions(referenceKey, questionToStore);
    if (!result) return Result(error: AddQuestionServiceError.databaseError);
    return Result(result: result);
  }
}