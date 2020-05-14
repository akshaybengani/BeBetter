import 'package:bebetter/graphql/query/user_query.dart';
import 'package:bebetter/models/user.dart';
import 'package:bebetter/services/api_service.dart';
import 'package:bebetter/services/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository{

  SharedPreferences prefs = SharedPreferencesService.prefs;

  setPrefs({String userId}) async {
    await prefs.setString('userId', userId);
    return userId;
  }

  String getUserIdFromPrefs() {
    return prefs.getString('userId');
  }

  
  Future<User> getUserByPrefsUserId() async {
    return getUserById(getUserIdFromPrefs());
  }

  Future<User> getUserById(userId) async {
    final response = await ApiService().query(getUserByIdQuery, {"id": userId});

    if (response == null) {
      return Future.value(User());
    } else {
      return User.fromJson(response['users'][0]);
    }
  }

}