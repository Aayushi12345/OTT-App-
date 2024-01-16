import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _kThemeColorKey = 'theme_color';
const String _kttnKey = 'ttn';

class SharedPreferencesService {

  static Future<bool> saveBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

  // Saves an integer value with the given key to SharedPreferences
  static Future<bool> saveInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setInt(key, value);
  }

  // Saves a double value with the given key to SharedPreferences
  static Future<bool> saveDouble(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setDouble(key, value);
  }

  // Saves a string value with the given key to SharedPreferences
  static Future<bool> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  // Saves a list of strings with the given key to SharedPreferences
  static Future<bool> saveStringList(String key, List<String> value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(key, value);
  }

  // Retrieves a boolean value with the given key from SharedPreferences
  static Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  // Retrieves an integer value with the given key from SharedPreferences
  static Future<int?> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  // Retrieves a double value with the given key from SharedPreferences
  static Future<double?> getDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  // Retrieves a string value with the given key from SharedPreferences
  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // Retrieves a list of strings with the given key from SharedPreferences
  static Future<List<String>?> getStringList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }


  // Removing data from SharedPreferences
  static Future<void> removeData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

// Clearing all data from SharedPreferences
  static Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }






}

//   static SharedPreferencesService? _instance;
//   static late SharedPreferences _preferences;
//   // SharedPreferencesService() {
//   //   SharedPreferencesService();
//   // }
//
//
//   SharedPreferencesService._();
//
//   // Using a singleton pattern
//   static Future<SharedPreferencesService> getInstance() async {
//     _instance ??= SharedPreferencesService._();
//
//     _preferences = await SharedPreferences.getInstance();
//
//     return _instance!;
//   }
//   int get ttnValue => _getData(_kttnKey) ?? 0;
//   set ttnValue(int value) => _saveData(_kttnKey, value);
//   // Persist and retrieve theme color
//   Color get themeColor => Color(_getData(_kThemeColorKey) ?? Colors.blue.value);
//   set themeColor(Color value) => _saveData(_kThemeColorKey, value.value);
//
//   dynamic _getData(String key) {
//     // Retrieve data from shared preferences
//     var value = _preferences.get(key);
//
//     // Easily log the data that we retrieve from shared preferences
//     debugPrint('Retrieved $key: $value');
//
//     // Return the data that we retrieve from shared preferences
//     return value;
//   }
//
//   void _saveData(String key, dynamic value) {
//     // Easily log the data that we save to shared preferences
//     debugPrint('Saving $key: $value');
//
//     // Save data to shared preferences
//     if (value is String) {
//       _preferences.setString(key, value);
//     } else if (value is int) {
//       _preferences.setInt(key, value);
//     } else if (value is double) {
//       _preferences.setDouble(key, value);
//     } else if (value is bool) {
//       _preferences.setBool(key, value);
//     } else if (value is List<String>) {
//       _preferences.setStringList(key, value);
//     }
//   }
// }