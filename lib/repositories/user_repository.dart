import 'package:bebetter/graphql/mutation/user_mutation.dart';
import 'package:bebetter/graphql/query/user_query.dart';
import 'package:bebetter/models/user.dart';
import 'package:bebetter/services/api_service.dart';
import 'package:bebetter/services/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  UserRepository._init();

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
    final response = await apiService.query(getUserByIdQuery, {"id": userId});
    if (response == null) {
      return Future.value(User());
    } else {
      return User.fromJson(response['users'][0]);
    }
  }

  Future<dynamic> createUserByAccessKey(String accessKey) async {
    return await apiService.mutation(createUserByAccessKeyMutation, {"access_key": accessKey});
  }
}

UserRepository userRepository = UserRepository._init();