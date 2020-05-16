import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _singleton = SharedPreferencesService._internal();
  static SharedPreferences prefs;

  factory SharedPreferencesService() {
    return _singleton;
  }
  SharedPreferencesService._internal();
}
