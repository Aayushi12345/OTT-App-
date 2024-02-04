import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {

  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  SharedPreferencesService._();

  static Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<SharedPreferencesService> getInstance() async {
    _instance ??=
        SharedPreferencesService._(); // Change here: Initialize if null
    await _init(); // Move the initialization inside getInstance method
    return _instance!; // Change here: Add a non-null assertion
  }

  // Save and retrieve String
  String getString(String key, {required String defaultValue}) {
    return _preferences?.getString(key) ?? defaultValue;
  }

  Future<void> saveString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  // Save and retrieve JSON using a model
  T? getObject<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    final jsonString = _preferences?.getString(key);
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      return fromJson(jsonMap);
    }
    return null;
  }

  Future<void> saveObject(String key, dynamic object) async {
    final jsonString = json.encode(object.toJson());
    await _preferences?.setString(key, jsonString);
  }

  // Save and retrieve a list of JSON using a model
  List<T> getList<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    final jsonStringList = _preferences?.getStringList(key);
    if (jsonStringList != null) {
      return jsonStringList.map((jsonString) {
        final Map<String, dynamic> jsonMap = json.decode(jsonString);
        return fromJson(jsonMap);
      }).toList();
    }
    return [];
  }

  Future<void> saveList(String key, List<dynamic> list) async {
    final jsonStringList = list.map((item) => json.encode(item)).toList();
    await _preferences?.setStringList(key, jsonStringList);
  }

  // Remove a list from SharedPreferences
  Future<void> removeList(String key) async {
    await _preferences?.remove(key);
  }

  static Future<bool> saveSingleString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future<String?> getSingleString(String? key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key!);
  }
}



// class SharedPreferencesService {
//
//   static Future<bool> saveBool(String key, bool value) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.setBool(key, value);
//   }
//
//   // Saves an integer value with the given key to SharedPreferences
//   static Future<bool> saveInt(String key, int value) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.setInt(key, value);
//   }
//
//   // Saves a double value with the given key to SharedPreferences
//   static Future<bool> saveDouble(String key, double value) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.setDouble(key, value);
//   }
//
//   // Saves a string value with the given key to SharedPreferences
//   static Future<bool> saveString(String key, String value) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.setString(key, value);
//   }
//   // static Future<void> clearData() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   await prefs.clear();
//   // }
//   // Saves a list of strings with the given key to SharedPreferences
//   static Future<bool> saveStringList(String key, List<String> value) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.setStringList(key, value);
//   }
//
//   // Retrieves a boolean value with the given key from SharedPreferences
//   static Future<bool?> getBool(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(key);
//   }
//
//   // Retrieves an integer value with the given key from SharedPreferences
//   static Future<int?> getInt(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getInt(key);
//   }
//
//   // Retrieves a double value with the given key from SharedPreferences
//   static Future<double?> getDouble(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getDouble(key);
//   }
//
//   // Retrieves a string value with the given key from SharedPreferences
//   static Future<String> getString(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(key)!;
//   }
//
//   // Retrieves a list of strings with the given key from SharedPreferences
//   static Future<List<String>?> getStringList(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getStringList(key);
//   }
//
//
//   // Removing data from SharedPreferences
//   static Future<void> removeData(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(key);
//   }
//
// // Clearing all data from SharedPreferences
//   static Future<void> clearData() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//   }
//
//
//
//
//
//
// }

