import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDatabaseHandler {
  Future<String> fetchQuestions(String referenceKey);
  Future<bool> storeQuestions(String referenceKey, String valueToStore);
}

class DefaultDatabaseHandler implements LocalDatabaseHandler {
  @override
  Future<String> fetchQuestions(String referenceKey) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(referenceKey);
    return result;
  }

  @override
  Future<bool> storeQuestions(String referenceKey, String valueToStore) async {
    final prefs = await SharedPreferences.getInstance();
    final result = await prefs.setString(referenceKey, valueToStore);
    return result;
  }
}
