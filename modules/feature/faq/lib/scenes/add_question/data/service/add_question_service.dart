import 'package:FAQ/scenes/add_question/data/models/add_question_service_error.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:foundation/generics/result.dart';
import 'package:local_database/local_database/hive/abstract_hive.dart';
// import 'package:local_database/local_database/local_database_handler.dart';

abstract class AddQuestionService {
  Future<Result<bool, AddQuestionServiceError>> storeQuestion(String questionToStore);
}


class DefaultAddQuestionService implements AddQuestionService {

  final _questionDB = Modular.get<QuestionDatabase>();

  @override
  Future<Result<bool, AddQuestionServiceError>> storeQuestion(String questionToStore) async {
    final result = await _questionDB.createQuestion(questionToStore);
    if (result == null) return Result(error: AddQuestionServiceError.databaseError);
    return Result(result: true);
  }
}