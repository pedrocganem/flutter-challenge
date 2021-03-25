import 'package:FAQ/faq_module.dart';
import 'package:flutter/material.dart';
import 'package:flutterChallenge/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:local_database/local_database.dart';
import 'package:foundation/constants/routes.dart';
import 'package:local_database/local_database/shared_preferences/abstract_shared_preferences.dart';
import 'package:splash_screen/scenes/splash_screen_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<QuestionDatabase>((_) => (HiveQuestionDatabase()),
            singleton: false),
        Bind<SharedPreferencesWrapper>((_) => LocalSharedPreferencesWrapper(), singleton: false)
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(AppRoutes.ROUTE_ROOT_VIEW, module: SplashScreenModule()),
        ModularRouter(AppRoutes.ROUTE_QUESTIONS_VIEW, module: FAQModule())
      ];
}
