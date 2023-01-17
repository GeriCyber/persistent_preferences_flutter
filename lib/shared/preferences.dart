import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _preferences;
  static String _toolName = '';
  static bool _isDarkMode = true;
  static int _language = 1;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String get tool {
    return _preferences.getString('toolName') ?? _toolName;
  }

  static set tool (String tool) {
    _toolName = tool;
    _preferences.setString('toolName', tool);
  }

  static bool get isDarkMode {
    return _preferences.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode (bool value) {
    _isDarkMode = value;
    _preferences.setBool('isDarkMode', value);
  }

  static int get language {
    return _preferences.getInt('language') ?? _language;
  }

  static set language (int lang) {
    _language = lang;
    _preferences.setInt('language', lang);
  }


}