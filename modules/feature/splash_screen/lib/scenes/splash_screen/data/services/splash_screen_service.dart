import 'package:flutter_modular/flutter_modular.dart';
import 'package:local_database/local_database/hive/abstract_hive.dart';
import 'package:local_database/local_database/shared_preferences/abstract_shared_preferences.dart';

abstract class SplashScreenService {
  Future<bool> isFirstLaunch();
   createQuestion(String question);
   setFirstLaunch();
}

class LocalSplashScreenService implements SplashScreenService {

  final _sharedPreferences = Modular.get<SharedPreferencesWrapper>();
  final _hive = Modular.get<QuestionDatabase>();

  @override
   createQuestion(String question) async {
    await _hive.createQuestion(question);
  }

  @override
  Future<bool> isFirstLaunch() async {
     return await _sharedPreferences.isFirstLaunch();
  }

  @override
  setFirstLaunch() async {
    await _sharedPreferences.setFirstLaunch();
  }

}

