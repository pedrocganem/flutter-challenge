import 'package:local_database/local_database/hive/abstract_hive.dart';

class QuestionDatabaseMock implements QuestionDatabase {
  List listToUse;
  int createQuestionCalledCount = 0;
  String createQuestionQuestionPassed;
  
  @override
  createQuestion(String question) {
    createQuestionCalledCount += 1;
    createQuestionQuestionPassed = question;
  }

  @override
  Future<List> fetchQuestions(String query) async {
    return listToUse;
  }
}
