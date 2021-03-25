
import 'package:flutter_modular/flutter_modular.dart';

import 'package:local_database/local_database/hive/abstract_hive.dart';
// import 'package:local_database/local_database/local_database_handler.dart';

abstract class AddQuestionService {
  storeQuestion(String questionToStore);
}

class DefaultAddQuestionService implements AddQuestionService {

  final _questionDB = Modular.get<QuestionDatabase>();

  @override
   storeQuestion(String questionToStore) async {
    await _questionDB.createQuestion(questionToStore);
  }
}