import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDatabaseHandler {
  Future<String> fetchQuestions();
  Future<bool> storeQuestions(String referenceKey, String valueToStore);
}

class DefaultDatabaseHandler implements LocalDatabaseHandler {

  final _referenceKey = 'question';

  @override
  Future<String> fetchQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(_referenceKey);
    return result;
  }

  @override
  Future<bool> storeQuestions(String referenceKey, String valueToStore) async {
    final prefs = await SharedPreferences.getInstance();
    final result = await prefs.setString(referenceKey, valueToStore);
    return result;
  }
}
