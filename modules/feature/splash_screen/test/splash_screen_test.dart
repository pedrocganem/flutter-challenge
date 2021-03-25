import 'lib/scenes/splash_screen/data/repositories/splash_screen_repository_tests.dart';
import 'lib/scenes/splash_screen/data/services/splash_screen_service_tests.dart';
import 'lib/scenes/splash_screen/domain/use_cases/create_default_questions_if_needed_use_case_tests.dart';
import 'lib/scenes/splash_screen/view/splash_screen_view_tests.dart';

void main() {
  testSplashScreenService();
  testSplashScreenRepository();
  testCreateDefaultQuestionsIfNeededUseCase();
  testSplashScreenView();
}