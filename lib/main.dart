import 'package:bebetter/repositories/user_repository.dart';
import 'package:bebetter/screens/navigationbar_screen.dart';
import 'package:bebetter/screens/signup_screen.dart';
import 'package:bebetter/services/share_prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesService.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Be Better',
      // Login Checker
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 1,
          color: Colors.yellow.shade100,
          iconTheme: IconThemeData(
            color: Colors.pink,
          ),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black, fontSize: 14),
          subtitle1: TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
      home: userRepository.getUserIdFromPrefs() == null
          ? SignupScreen()
          : NavigationBarScreen(),
    );
  }
}
