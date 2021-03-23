import 'package:FAQ/scenes/add_question/data/models/add_question_use_case_error.dart';
import 'package:FAQ/scenes/add_question/data/repositories/add_question_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:foundation/generics/result.dart';
import 'package:models/models/question_model.dart';

abstract class AddQuestionUseCase {
  Future<Result<bool, AddQuestionUseCaseError>> storeQuestion(
      String colorHex, String title, String content);
}

class DefaultAddQuestionUseCase implements AddQuestionUseCase {
  final _repository = Modular.get<AddQuestionRepository>();

  @override
  Future<Result<bool, AddQuestionUseCaseError>> storeQuestion(
      String hexColor, String title, String content) async {
    final questionToStore =
        QuestionModel(hexColor: hexColor, content: content, title: title);
    final result = await _repository.storeQuestion(questionToStore);
    if (result.error != null)
      return Result(error: AddQuestionUseCaseError.repositoryError);
    return Result(result: true);
  }
}
