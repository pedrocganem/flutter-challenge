import 'lib/scenes/add_question/data/repositories/add_question_repositories_tests.dart';
import 'lib/scenes/add_question/data/service/add_question_service_tests.dart';
import 'lib/scenes/add_question/domain/use_case/add_question_use_case_tests.dart';
import 'lib/scenes/add_question/view/add_question_view_tests.dart';
import 'lib/scenes/question/data/repositories/question_repository_tests.dart';
import 'lib/scenes/question/data/services/question_service_tests.dart';
import 'lib/scenes/question/domain/use_cases/fetch_questions_use_case_tests.dart';
import 'lib/scenes/question/view/questions_view_tests.dart';

void main() {
  //Questions
  testQuestionService();
  testQuestionRepository();
  testFetchQuestionsUseCase();
  testQuestionView();

  //AddQuestion
  testAddQuestionService();
  testAddQuestionRepository();
  testAddQuestionUseCase();
  testAddQuestionView();
}
