// import 'package:FAQ/add_question/data/models/add_question_use_case_error.dart';
// import 'package:FAQ/add_question/data/repositories/add_question_repository.dart';
// import 'package:FAQ/questions/data/models/question_model.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:foundation/generics/result.dart';

// abstract class AddQuestionUseCase {
//   Future<Result<bool, AddQuestionUseCaseError>> storeQuestion(
//       String referenceKey, String colorHex, String title, String content);
// }

// class DefaultAddQuestionUseCase implements AddQuestionUseCase {
//   final _repository = Modular.get<AddQuestionRepository>();

//   @override
//   Future<Result<bool, AddQuestionUseCaseError>> storeQuestion(
//       String referenceKey,
//       String colorHex,
//       String title,
//       String content) async {
//     final questionToStore =
//         QuestionModel(cardColor: colorHex, content: content, title: title);
//     final result =
//         await _repository.storeQuestion(referenceKey, questionToStore);
//     if (result.error != null)
//       return Result(error: AddQuestionUseCaseError.repositoryError);
//     return Result(result: true);
//   }
// }
