import 'package:FAQ/scenes/questions/data/models/questions_service_error.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:foundation/generics/result.dart';
import 'package:local_database/local_database.dart';

abstract class QuestionService {
  Future<Result<List<String>, QuestionServiceError>> fetchQuestions(String query);
}

class LocalQuestionsService implements QuestionService {
  final _questionDB = Modular.get<QuestionDatabase>();

  @override
  Future<Result<List<String>, QuestionServiceError>> fetchQuestions(String query) async {
    final result = await _questionDB.fetchQuestions(query);
    print('service ------> $result');
    if (result == null) return Result(error: QuestionServiceError.dbError);
    return Result(result: result, error: null);
  }
}
