import 'package:shared_preferences/shared_preferences.dart';

class PreferencesKeys {
  static const accessToken = 'acc_token';
  static const refreshToken = 'ref_token';
}

class AppSharedPreferences {
  Future<SharedPreferences> get getInstance async =>
      await SharedPreferences.getInstance();

  Future<bool> clear() async {
    SharedPreferences prefs = await getInstance;
    return prefs.clear();
  }

  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await getInstance;
    return prefs.getString(PreferencesKeys.accessToken);
  }

  Future<bool> setAccessToken(String value) async {
    SharedPreferences prefs = await getInstance;
    return prefs.setString(PreferencesKeys.accessToken, value);
  }

  Future<String?> getRefreshToken() async {
    SharedPreferences prefs = await getInstance;
    return prefs.getString(PreferencesKeys.refreshToken);
  }

  Future<bool> setRefreshToken(String value) async {
    SharedPreferences prefs = await getInstance;
    return prefs.setString(PreferencesKeys.refreshToken, value);
  }
}
