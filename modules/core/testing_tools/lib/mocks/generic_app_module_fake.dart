import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:testing_tools/mocks/generic_app_module_stub.dart';

class GenericAppModuleFake<T> extends IModularTest {
  final T stub;

  GenericAppModuleFake(this.stub);
  @override
  List<Bind> get binds => [];

  @override
  IModularTest get modulardependency => null;

  @override
  ChildModule get module => GenericAppModuleStub<T>(stub);
}
