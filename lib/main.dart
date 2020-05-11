import 'package:bebetter/screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
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
      home: SignupScreen(),
    );
  }
}
