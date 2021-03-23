import 'package:hive/hive.dart';

abstract class QuestionDatabase {
  Future<List<dynamic>> fetchQuestions(String query);
  createQuestion(String question);
}

class HiveQuestionDatabase implements QuestionDatabase {
  @override
  createQuestion(String question) async {
    print('creating question ........'); 
    final hive = await Hive.openBox('questions');
    await hive.add(question);
    print('question created');
  }

  @override
  Future<List<String>> fetchQuestions(String query) async {
    final hive = await Hive.openBox('questions');
    final list = List<String>.from(hive.values);
    print('HIVE fetchQuestion() -------> $list');
    final result = list.where((element) => element.contains(query)).toList();
    return result;
  }
}
