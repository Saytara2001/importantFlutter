import 'dart:async';
import 'package:informermobile_flutter/data/shared_pref/constants/SharedPrefConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance
  final Future<SharedPreferences> _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // General Methods: ----------------------------------------------------------
  Future<String> get authToken async {
    return _sharedPreference.then((preference) {
      return preference.getString(SharedPrefConstants.auth_token);
    });
  }

  Future<void> saveAuthToken(String authToken) async {
    return _sharedPreference.then((preference) {
      preference.setString(SharedPrefConstants.auth_token, authToken);
    });
  }

  Future<void> removeAuthToken() async {
    return _sharedPreference.then((preference) {
      preference.remove(SharedPrefConstants.auth_token);
    });
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return _sharedPreference.then((preference) {
      return preference.getBool(SharedPrefConstants.is_logged_in) ?? false;
    });
  }

  Future<void> saveIsLoggedIn(bool value) async {
    return _sharedPreference.then((preference) {
      preference.setBool(SharedPrefConstants.is_logged_in, value);
    });
  }

  // Language:---------------------------------------------------
  Future<String> get currentLanguage {
    return _sharedPreference.then((prefs) {
      return prefs.getString(SharedPrefConstants.current_language);
    });
  }

  Future<void> changeLanguage(String language) {
    return _sharedPreference.then((prefs) {
      return prefs.setString(SharedPrefConstants.current_language, language);
    });
  }
}
