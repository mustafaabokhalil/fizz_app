import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static bool? isvisitor;
  static String? token;
  static Future saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {}
  }

  static Future<dynamic> readData(String key, {String from = ''}) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key);

    return obj;
  }

  static Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static Future<bool> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
