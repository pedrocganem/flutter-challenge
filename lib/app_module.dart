import 'package:FAQ/faq_module.dart';
import 'package:FAQ/questions/view/questions_view.dart';
import 'package:flutter/material.dart';
import 'package:flutterChallenge/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:local_database/local_database/local_database_handler.dart';
import 'package:foundation/constants/routes.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    Bind<LocalDatabaseHandler>((_) => DefaultDatabaseHandler(), singleton: false),
  ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
    ModularRouter(AppRoutes.ROUTE_ROOT_VIEW, module: FAQModule())
  ];
}
