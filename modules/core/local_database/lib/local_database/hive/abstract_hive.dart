import 'package:hive/hive.dart';

abstract class QuestionDatabase {
  Future<List<String>> fetchQuestions(String query);
  createQuestion(String question);
}

class HiveQuestionDatabase implements QuestionDatabase {

  @override
  createQuestion(String question) async {
    final hive = await Hive.openBox('questions');
    hive.add(question);
  }

  @override
  Future<List<String>> fetchQuestions(String query) async {
    final hive = await Hive.openBox('questions');
    return hive.values
      .where((element) => element.contains(query))
      .toList();
  }
}
