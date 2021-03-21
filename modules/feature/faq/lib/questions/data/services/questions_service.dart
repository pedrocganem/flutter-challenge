import 'package:FAQ/questions/data/models/questions_service_error.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:foundation/generics/result.dart';
import 'package:local_database/local_database.dart';

abstract class QuestionService {
  Future<Result<String, QuestionServiceError>> fetchQuestions(
      String referenceKey);
}

class LocalQuestionsService implements QuestionService {
  final _localDB = Modular.get<LocalDatabaseHandler>();

  @override
  Future<Result<String, QuestionServiceError>> fetchQuestions(
      String referenceKey) async {
    final result = await _localDB.fetchQuestions(referenceKey);
    if (result != null) return Result(error: QuestionServiceError.dbError);
    return Result(result: result);
  }
}
