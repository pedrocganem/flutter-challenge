import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterChallenge/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [];
}
