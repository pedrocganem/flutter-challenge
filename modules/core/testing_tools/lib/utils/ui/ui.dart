import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UIUtils {
  static Widget makeTestable(Widget widget) {
    return ModularApp(
        module: FakeUIModule(
            MaterialApp(home: widget))); 
  }
}

class FakeUIModule extends MainModule {
  final Widget widget;

  FakeUIModule(this.widget);
  @override
  List<Bind> get binds => [];

  @override
  Widget get bootstrap => widget;

  @override
  List<ModularRouter> get routers => [];
}



