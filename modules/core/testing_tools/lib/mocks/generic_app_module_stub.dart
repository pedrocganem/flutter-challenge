import 'package:flutter_modular/flutter_modular.dart';

class GenericAppModuleStub<T> extends ChildModule {
  final T stub;

  GenericAppModuleStub(this.stub);

  @override
  List<Bind> get binds => [Bind<T>((i) => stub)];

  @override
  List<ModularRouter> get routers => [];
}
