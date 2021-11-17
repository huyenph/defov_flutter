import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const String tokenKey = 'token';

  static SharedPreferences? _prefs;

  Future<SharedPreferences> _getPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  Future setToken(String token) async {
    SharedPreferences preferences = await _getPrefs();
    preferences.setString(tokenKey, token);
  }

  Future<String> get token async {
    SharedPreferences preferences = await _getPrefs();
    return preferences.getString(tokenKey)!;
  }

  Future logout() async {
    await setToken('');
  }
}