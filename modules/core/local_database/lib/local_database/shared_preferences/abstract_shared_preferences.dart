import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesWrapper {
  setFirstLaunch();
  Future<bool> isFirstLaunch();
}

class LocalSharedPreferencesWrapper implements SharedPreferencesWrapper {
  @override
  Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedValue = prefs.getBool('is_first_launch');
    print(cachedValue);
    return cachedValue != true;
  }

  @override
  setFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_first_launch', true);
  }
}
