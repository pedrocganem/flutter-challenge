import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_module.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final provider = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(provider.path);
  runApp(ModularApp(module: AppModule()));
}
