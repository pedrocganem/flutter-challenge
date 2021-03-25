import 'package:flutter_modular/flutter_modular.dart';
import 'package:foundation/foundation.dart';
import 'package:splash_screen/scenes/splash_screen/data/repositories/splash_screen_repository.dart';
import 'package:splash_screen/scenes/splash_screen/data/services/splash_screen_service.dart';
import 'package:splash_screen/scenes/splash_screen/domain/use_cases/create_default_question_if_needed_use_case.dart';
import 'package:splash_screen/scenes/splash_screen/view/splash_screen_view.dart';
import 'package:splash_screen/scenes/splash_screen/view/splash_screen_view_model.dart';

class SplashScreenModule extends ChildModule {
  @override

  List<Bind> get binds => [
    Bind<SplashScreenService>((_) => LocalSplashScreenService(), singleton: false),
    Bind<SplashScreenRepository>((_) => DefaultSplashScreenRepository(), singleton: false),
    Bind<CreateDefaultQuestionsIfNeededUseCase>((_) => DefaultCreateDefaultQuestionsIfNeededUseCase(), singleton: false),
    Bind<SplashScreenViewModel>((_) => DefaultSplashScreenViewModel(), singleton: false),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(AppRoutes.ROUTE_ROOT_VIEW ,child: (_, args) => SplashScreenView())
  ];
}