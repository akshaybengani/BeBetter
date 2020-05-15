import 'package:bebetter/graphql/mutation/user_mutation.dart';
import 'package:bebetter/graphql/query/user_query.dart';
import 'package:bebetter/models/user.dart';
import 'package:bebetter/services/api_service.dart';
import 'package:bebetter/services/share_prefs_service.dart';

class UserRepository {
  UserRepository._init();

  void setUserIdInSharePref(String userId) {
    sharePrefsService.setString(key: "userId", value: userId);
  }

  Future<String> getUserIdFromSharePref() async {
    return await sharePrefsService.getString(key: "userId");
  }

  Future<User> getUserByAccessKey(accessKey) async {
    final response = await apiService.query(getUserByIdQuery, {"access_key": accessKey});
    if (response == null) {
      return Future.value(User());
    } else {
      return User.fromJson(response['user'][0]);
    }
  }

  Future<dynamic> createUserByAccessKey(String accessKey) async {
    final response =  await apiService.returningMutation(createUserByAccessKeyMutation, {"access_key": accessKey});
    if(response == 'Uniqueness violation. duplicate key value violates unique constraint "user_email_key"') {
      return "existing_user";
    } else if(response is Map<String, dynamic>) {
      return response['insert_user']['returning'][0]['user_id'];
    } else {
      print("Some other issue");
      return null;
    }
  }
}

UserRepository userRepository = UserRepository._init();