import 'package:FAQ/scenes/add_question/data/repositories/add_question_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/models/question_model.dart';

abstract class AddQuestionUseCase {
  storeQuestion(String colorHex, String title, String content);
}

class DefaultAddQuestionUseCase implements AddQuestionUseCase {
  final _repository = Modular.get<AddQuestionRepository>();

  @override
  storeQuestion(String hexColor, String title, String content) async {
    final questionToStore =
        QuestionModel(hexColor: hexColor, content: content, title: title);
    await _repository.storeQuestion(questionToStore);
  }
}
