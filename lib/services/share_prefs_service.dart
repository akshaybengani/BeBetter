import 'package:shared_preferences/shared_preferences.dart';

class SharePrefsService{

  SharePrefsService._init();

   setString({String key, String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> getString({String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

}
SharePrefsService sharePrefsService = SharePrefsService._init();