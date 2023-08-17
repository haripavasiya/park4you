import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  PreferenceUtils.setMockInitialValues();
  static Future<SharedPreferences> get _instance async => _prefsInstance = await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String getString(String key, [String? defValue]) {
    return _prefsInstance?.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static Future<bool> setLogin(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static bool getLogin(String key, [bool? defValue])  {
    return _prefsInstance?.getBool(key) ??defValue?? false;

  }

  static Future<void> clear() async {
    await _prefsInstance?.clear();
  }
  static void remove(String key) async {
    _prefsInstance?.remove(key);
  }
}