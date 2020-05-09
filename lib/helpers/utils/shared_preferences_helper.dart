import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static String SECURITY_BOX = "SECURITY_BOX";
  static String TOKEN_KEY = "TOKEN";

  static Future<void> _saveString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String> _loadString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future _saveDouble(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  static Future<double> _loadDouble(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  static Future<void> saveToken(String token) async {
    await _saveString(TOKEN_KEY, token);
  }

  static Future<String> loadToken() async {
    return _loadString(TOKEN_KEY);
  }
}
