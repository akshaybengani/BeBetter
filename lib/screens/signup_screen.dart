import 'package:bebetter/screens/home_screen.dart';
import 'package:bebetter/screens/navigationbar_screen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Welcome to BeBetter",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.pink),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                TextField(decoration: InputDecoration(labelText: "Email")),
                TextField(decoration: InputDecoration(labelText: "Password")),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NavigationBarScreen(),
                    ));
                  },
                  child: Text("Login"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
