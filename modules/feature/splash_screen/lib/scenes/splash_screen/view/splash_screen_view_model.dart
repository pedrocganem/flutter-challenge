import 'package:flutter_modular/flutter_modular.dart';
import 'package:splash_screen/scenes/splash_screen/domain/use_cases/create_default_question_if_needed_use_case.dart';

abstract class SplashScreenViewModel {
  viewDidLoad();
}

class DefaultSplashScreenViewModel implements SplashScreenViewModel {
  final _useCase = Modular.get<CreateDefaultQuestionsIfNeededUseCase>();

  @override
  viewDidLoad() async {
    Future.delayed(Duration(seconds: 2), () async {
      await _useCase.execute();
      Modular.to.pushNamed('/questions');
    });
  }
}
